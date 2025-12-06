package com.music.user.entity;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "playlists")
public class Playlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer playlistId;

    @Column(nullable = false)
    private String playlistName;

    // Link Playlist to a User (Many playlists can belong to One user)
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // Store the IDs of the songs added to this playlist
    // We store Strings (Song IDs) because the actual Song entity is in AdminService
    @ElementCollection
    @CollectionTable(name = "playlist_songs", joinColumns = @JoinColumn(name = "playlist_id"))
    @Column(name = "song_id")
    private List<String> songIds = new ArrayList<>();

    // --- Constructors ---
    public Playlist() {}

    public Playlist(String playlistName, User user) {
        this.playlistName = playlistName;
        this.user = user;
    }

    // --- Getters and Setters ---
    public Integer getPlaylistId() { return playlistId; }
    public void setPlaylistId(Integer playlistId) { this.playlistId = playlistId; }

    public String getPlaylistName() { return playlistName; }
    public void setPlaylistName(String playlistName) { this.playlistName = playlistName; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public List<String> getSongIds() { return songIds; }
    public void setSongIds(List<String> songIds) { this.songIds = songIds; }
}