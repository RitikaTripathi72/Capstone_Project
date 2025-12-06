package com.music.admin.service;

import com.music.admin.entity.SongsLibrary;
import com.music.admin.repository.SongsLibraryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SongsService {

	
	 @Autowired
	    private RestTemplate restTemplate;
	 
    @Autowired
    private SongsLibraryRepository songsRepository;

   
    
    public SongsLibrary addSong(SongsLibrary song) {
    	SongsLibrary savedSong = songsRepository.save(song);

        // ✅ SEND NOTIFICATION
        try {
            String notificationUrl = "http://localhost:8083/api/notifications/song-added";
            
            Map<String, String> notification = new HashMap<>();
            notification.put("songName", savedSong.getSongName());
            notification.put("singer", savedSong.getSinger());
            notification.put("musicDirector", savedSong.getMusicDirector());
            notification.put("albumName", savedSong.getAlbumName());
            notification.put("releaseDate", savedSong.getReleaseDate().toString());
            
            restTemplate.postForObject(notificationUrl, notification, String.class);
            
            System.out.println("✅ Notification sent for new song: " + savedSong.getSongName());
        } catch (Exception e) {
            System.err.println("⚠ Failed to send notification: " + e.getMessage());
        }
        
        return savedSong;
    }

    public List<SongsLibrary> getAllSongs() {
        return songsRepository.findAll();
    }

    public List<SongsLibrary> getAvailableSongs() {
        return songsRepository.findBySongStatus("AVAILABLE");
    }

    public List<SongsLibrary> getFreeSongs() {
        return songsRepository.findBySongType("FREE");
    }

    public SongsLibrary updateSong(Integer id, SongsLibrary songData) {
        return songsRepository.findById(id).map(song -> {
            song.setSongName(songData.getSongName());
            song.setSinger(songData.getSinger());
            song.setAlbumName(songData.getAlbumName());
            song.setMusicDirector(songData.getMusicDirector());
            song.setReleaseDate(songData.getReleaseDate());
            song.setSongStatus(songData.getSongStatus());
            song.setSongType(songData.getSongType());
            return songsRepository.save(song);
        }).orElseThrow(() -> new RuntimeException("Song not found"));
    }

    public void deleteSong(Integer id) {
        songsRepository.deleteById(id);
    }
 // NEW: Get single song for editing
    public SongsLibrary getSongById(Integer id) {
        return songsRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Song not found with id: " + id));
    }

    public List<SongsLibrary> searchSongs(String keyword) {
        return songsRepository.searchAcrossFields(keyword);
    }
}
