package com.music.admin.controller;

import com.music.admin.entity.Admin;
import com.music.admin.service.AdminService;
import com.music.admin.util.JwtUtil; // Import JwtUtil
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;
import com.music.admin.dto.LoginRequest;      
import com.music.admin.dto.AuthResponse; 

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "*")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private JwtUtil jwtUtil; // 1. Inject JwtUtil
    
    // Admin Login
//    @PostMapping("/login")
//    public ResponseEntity<?> loginAdmin(@RequestBody LoginRequest loginRequest) {
//        try {
//            // 1. Authenticate admin (password check happens in service)
//            Admin admin = adminService.loginAdmin(loginRequest.getUserName(), loginRequest.getPassword());
//
//            // 2. Generate JWT Token
//            String token = jwtUtil.generateToken(admin.getUserName());
//
//            // 3. Create AuthResponse DTO (NO PASSWORD!)
//
//   Map<String, String> loginData
//    String userName = loginData.get("userName");
//    String password = loginData.get("password");
//        } catch (Exception e) {
//            return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
//        }
//    }
    
    @PostMapping("/login")
    public ResponseEntity<?> loginAdmin(@RequestBody LoginRequest loginRequest) {
        try {
            
               // 1. Check Credentials
            Admin admin = adminService.loginAdmin(loginRequest.getUserName(), loginRequest.getPassword());
            
            // 2. Generate Token (THIS WAS MISSING)
            String token = jwtUtil.generateToken(admin.getUserName());
            
            // 3. Return Token + Admin Details

            Map<String, Object> response = new HashMap<>();
           response.put("token", token);
           response.put("admin", admin);
           
           return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
        }
    }
    
    
    @PostMapping("/register")
    public ResponseEntity<?> registerAdmin(@RequestBody Admin admin) {
        try {
            Admin savedAdmin = adminService.addAdmin(admin);
            return new ResponseEntity<>(savedAdmin, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}