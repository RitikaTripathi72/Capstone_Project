package com.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminViewController {
    
    
    
    
    @GetMapping("/admin/login")
    public String adminLoginPage() {
        return "adminLogin";
    }
    
    // Admin Dashboard
    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }
   
    // View Users Page
    @GetMapping("/admin/users")
    public String viewUsersPage() {
        return "users";
    }
 // Show Admin Registration Page
    @GetMapping("/admin/register")
    public String showAdminRegisterPage() {
        return "adminRegister"; // This loads adminRegister.jsp
    }
}