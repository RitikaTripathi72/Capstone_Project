package com.music.admin.controller;

//import java.util.List;
//
//import org.springframework.web.multipart.MultipartFile;
//import java.nio.file.*;
//import java.io.IOException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.music.admin.entity.SongsLibrary;
//import com.music.admin.service.SongsService;
//
//
//
//@Controller
//public class SongsController {
//
//    @Autowired
//    private SongsService songsService;
//
//    // 1. Show the "Add Song" Page
//    @GetMapping("/admin/add-song")
//    public String showAddSongPage() {
//        return "addSong"; // This loads addSong.jsp
//    }
//
//    // 2. Handle the "Add Song" Form Submission
////    @PostMapping("/admin/songs/add")
////    public String addSong(@ModelAttribute SongsLibrary song) {
////        songsService.addSong(song);
////        return "redirect:/admin/songs"; // Redirect to list after adding
////    }
//
//    @PostMapping("/admin/songs/add")
//    public String addSong(@ModelAttribute SongsLibrary song, 
//                          @RequestParam("file") MultipartFile file) {
//        try {
//            // Save file to 'src/main/resources/static/audio'
//            String uploadDir = "src/main/resources/static/audio";
//            Path uploadPath = Paths.get(uploadDir);
//            if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);
//
//            String fileName = file.getOriginalFilename();
//            Path filePath = uploadPath.resolve(fileName);
//            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//
//            // Save path to DB
//            song.setAudioPath("/audio/" + fileName);
//            songsService.addSong(song);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return "redirect:/admin/songs"; 
//    }
//
//    // 3. Show "All Songs" Page (UI)
//    @GetMapping("/admin/songs")
//    public String viewSongs(Model model) {
//        List<SongsLibrary> songs = songsService.getAllSongs();
//        model.addAttribute("songs", songs);
//        return "viewSongs"; // This loads viewSongs.jsp
//    }
//
//    // 4. API to Get All Songs (For Search/JSON)
//    @GetMapping("/api/songs/all")
//    @ResponseBody
//    public List<SongsLibrary> getAllSongsAPI() {
//        return songsService.getAllSongs();
//    }
//    
//    // 5. Delete Song
//    @GetMapping("/admin/songs/delete")
//    public String deleteSong(@RequestParam Integer id) {
//        songsService.deleteSong(id);
//        return "redirect:/admin/songs";   
//    }
//    @GetMapping("/api/songs/search")
//    @ResponseBody
//    public List<SongsLibrary> searchSongs(@RequestParam String keyword) {
//        return songsService.searchSongs(keyword);
//    }
// // 6. Show "Edit Song" Page
//    @GetMapping("/admin/songs/edit")
//    public String showEditSongPage(@RequestParam Integer id, Model model) {
//        SongsLibrary song = songsService.getSongById(id);
//        model.addAttribute("song", song);
//        return "editSong"; // We will create this JSP next
//    }
//
//     7. Handle "Update Song" Form Submission
//    @PostMapping("/admin/songs/update")
//    public String updateSong(@ModelAttribute SongsLibrary song) {
//        // Use the ID from the form to update
//        songsService.updateSong(song.getLibraryId(), song);
//        return "redirect:/admin/songs";
//    }
//    @PostMapping("/admin/songs/update")
//    public String updateSong(@ModelAttribute SongsLibrary song,
//                             @RequestParam(value = "file", required = false) MultipartFile file) {
//        try {
//            if (file != null && !file.isEmpty()) {
//                String uploadDir = "src/main/resources/static/audio";
//                Path uploadPath = Paths.get(uploadDir);
//                if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);
//
//                String fileName = file.getOriginalFilename();
//                Path filePath = uploadPath.resolve(fileName);
//                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//                
//                song.setAudioPath("/audio/" + fileName);
//            }
//            songsService.updateSong(song.getLibraryId(), song);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        
//        return "redirect:/admin/songs";
//    }
//}




import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import java.nio.file.*;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.admin.entity.SongsLibrary;
import com.music.admin.service.SongsService;

@Controller
public class SongsController {

    @Autowired
    private SongsService songsService;

    // 1. Show the "Add Song" Page
    @GetMapping("/admin/add-song")
    public String showAddSongPage() {
        return "addSong"; // This loads addSong.jsp
    }

    // 2. Handle the "Add Song" Form Submission
    @PostMapping("/admin/songs/add")
    public String addSong(@ModelAttribute SongsLibrary song, 
                          @RequestParam("file") MultipartFile file) {
        
        try {
            // 1. Define folder path (inside src/main/resources/static/audio)
            String uploadDir = "src/main/resources/static/audio";
            
            // 2. Create directory if it doesn't exist
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 3. Save the file
            String fileName = file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // 4. Save path to DB (Browser accesses via /audio/filename.mp3)
            song.setAudioPath("/audio/" + fileName);

            // 5. Save song
            songsService.addSong(song);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/admin/songs"; 
    }

    // 3. Show "All Songs" Page (UI)
    @GetMapping("/admin/songs")
    public String viewSongs(Model model) {
        List<SongsLibrary> songs = songsService.getAllSongs();
        model.addAttribute("songs", songs);
        return "viewSongs"; // This loads viewSongs.jsp
    }

    // 4. API to Get All Songs (For Search/JSON)
    @GetMapping("/api/songs/all")
    @ResponseBody
    public List<SongsLibrary> getAllSongsAPI() {
        return songsService.getAllSongs();
    }
    
    // 5. Delete Song
    @GetMapping("/admin/songs/delete")
    public String deleteSong(@RequestParam Integer id) {
        songsService.deleteSong(id);
        return "redirect:/admin/songs";   
    }
    @GetMapping("/api/songs/search")
    @ResponseBody
    public List<SongsLibrary> searchSongs(@RequestParam String keyword) {
        return songsService.searchSongs(keyword);
    }
 // 6. Show "Edit Song" Page
    @GetMapping("/admin/songs/edit")
    public String showEditSongPage(@RequestParam Integer id, Model model) {
        SongsLibrary song = songsService.getSongById(id);
        model.addAttribute("song", song);
        return "editSong"; // We will create this JSP next
    }

    // 7. Handle "Update Song" Form Submission
    @PostMapping("/admin/songs/update")
    public String updateSong(@ModelAttribute SongsLibrary song,
                             @RequestParam(value = "file", required = false) MultipartFile file) {
        try {
            // Check if a NEW file is uploaded
            if (file != null && !file.isEmpty()) {
                // 1. Define upload folder
                String uploadDir = "src/main/resources/static/audio";
                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // 2. Save the new file
                String fileName = file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // 3. Set the new path
                song.setAudioPath("/audio/" + fileName);
            }
            
            // 4. Update the song in DB (Service will handle the null check)
            songsService.updateSong(song.getLibraryId(), song);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/admin/songs";
    }
    
    @GetMapping("/api/songs/available")
    @ResponseBody
    public List<SongsLibrary> getAvailableSongsAPI() {
        return songsService.getAvailableSongs();
    }
}