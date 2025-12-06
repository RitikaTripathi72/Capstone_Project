package com.music.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.userdetails.UserDetails; // 1. NEW IMPORT: Spring Security Core
import com.music.user.entity.User;
import com.music.user.service.CustomUserDetailsService; // 3. NEW IMPORT: Security User Loader
import com.music.user.service.UserService;
import com.music.user.util.JwtUtil; // 4. NEW IMPORT: JWT Utility (You created this)
import com.music.user.dto.LoginRequest;      
import com.music.user.dto.AuthenticationResponse;   

@RestController 
@RequestMapping ("/api/users")
@CrossOrigin(origins = "*")
public class UserController {
    
    @Autowired
    private UserService userService;

    // 👇 NEW DEPENDENCIES FOR SECURITY (Crucial for JWT Login) 👇
    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private JwtUtil jwtUtil;
    // 👆 NEW DEPENDENCIES FOR SECURITY 👆
    
    // Add User (Registration)
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody User user) {
        try {
            // Note: Password hashing happens inside UserService.addUser()
            User savedUser = userService.addUser(user);
            return new ResponseEntity<>(savedUser, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
    
    // Show All Users
    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }
    
    // Get User by ID
    @GetMapping("/{id}")
    public ResponseEntity<?> getUserById(@PathVariable Integer id) {
        try {
            User user = userService.getUserById(id)
                    .orElseThrow(() -> new RuntimeException("User not found!"));
            return new ResponseEntity<>(user, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
    
    // Login User (UPDATED FOR JWT GENERATION)
    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody LoginRequest loginRequest) {
        try {
            // 1. Authenticate user (password verification happens in service)
            User user = userService.loginUser(loginRequest.getUserName(), loginRequest.getPassword());
            
            // 2. Load Spring Security's UserDetails
            UserDetails userDetails = userDetailsService.loadUserByUsername(loginRequest.getUserName());
            
            // 3. Generate JWT Token
            String jwt = jwtUtil.generateToken(userDetails);

            // 4. Create AuthResponse DTO (NO PASSWORD!)
            return ResponseEntity.ok(new AuthenticationResponse(jwt, user.getUserId()));
            
        } catch (RuntimeException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
        }
    }

    
//    @PostMapping("/login")
//    public ResponseEntity<?> loginUser(@RequestBody Map<String, String> loginData) {
//        try {
//            String userName = loginData.get("userName");
//            
//            // 1. Authenticate user existence (UserService handles the basic check)
//            User user = userService.loginUser(userName, "password_placeholder"); // Password check is handled by Security
//            
//            // 2. Load Spring Security's UserDetails object
//            final UserDetails userDetails = userDetailsService.loadUserByUsername(userName);
//            
//            // 3. Generate Token
//            final String jwt = jwtUtil.generateToken(userDetails);
//            
//            // 4. Return the Token and User ID
//            return ResponseEntity.ok(new AuthenticationResponse(jwt, user.getUserId()));
//
//        } catch (RuntimeException e) {
//            return new ResponseEntity<>(e.getMessage(), HttpStatus.UNAUTHORIZED);
//        }
//    }
    
    // Update User Details
    @PutMapping("/{id}")
    public ResponseEntity<?> updateUser(@PathVariable Integer id, @RequestBody User user) {
        try {
            User updatedUser = userService.updateUser(id, user);
            return new ResponseEntity<>(updatedUser, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
    
    // Delete User
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable Integer id) {
        try {
            userService.deleteUser(id);
            return new ResponseEntity<>("User deleted successfully!", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }

    // Update User Status (Block/Unblock)
    @PutMapping("/status/{id}")
    public ResponseEntity<?> updateUserStatus(@PathVariable Integer id, @RequestParam String status) {
        try {
            userService.updateStatus(id, status);
            return new ResponseEntity<>("User status updated to " + status, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
}