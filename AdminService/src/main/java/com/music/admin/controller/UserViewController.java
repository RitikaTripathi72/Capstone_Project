package com.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserViewController {

    // --- 1. PUBLIC PAGES (Missing in your current file) ---
    
    // Home Page (Where "User Login" button lives)
    @GetMapping("/") 
    public String home() {
        return "home"; 
    }

    // User Login Page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }

    // User Register Page
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; 
    }

    // --- 2. USER DASHBOARD & LIBRARY ---

    @GetMapping("/user/dashboard")
    public String showUserDashboard() {
        return "userDashboard";
    }

    @GetMapping("/user/library")
    public String showUserLibrary() {
        return "userLibrary";
    }

    // --- 3. PLAYLIST PAGES ---

    @GetMapping("/user/playlists")
    public String showPlaylistsPage() {
        return "myPlaylists";
    }

    @GetMapping("/user/playlist/details")
    public String showPlaylistDetails() {
        return "playlistDetails";
    }
    @GetMapping("/user/profile")
    public String showUserProfile() {
        return "userProfile";
    }
}