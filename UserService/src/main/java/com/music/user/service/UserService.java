package com.music.user.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder; // NEW IMPORT
import org.springframework.stereotype.Service;

import com.music.user.entity.User;
import com.music.user.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder; // NEW DEPENDENCY

    // 1. Add User (UPDATED TO HASH PASSWORD)
    public User addUser(User user) {
        // HASH THE PASSWORD before saving to the database
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        
        // You can add check if username/email exists here
        return userRepository.save(user);
    }

    // 2. Get All Users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // 3. Get User By ID
    public Optional<User> getUserById(Integer id) {
        return userRepository.findById(id);
    }

    // 4. Login User (SIMPLIFIED for Spring Security)
    public User loginUser(String userName, String password) {
        // Spring Security handles the password check; we only need to verify the user exists.
        User user = userRepository.findByUserName(userName);
        if (user == null) {
            throw new RuntimeException("Invalid Username or Password");
        }
        // If the user exists, we return the user object. Security handles the rest.
        return user;
    }

//     5. Update User (Full Update)
    public User updateUser(Integer id, User userDetails) {
       User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));

        user.setFirstName(userDetails.getFirstName());
        user.setLastName(userDetails.getLastName());
        user.setEmail(userDetails.getEmail());
        user.setMobile(userDetails.getMobile());
        user.setCity(userDetails.getCity());
        user.setCountry(userDetails.getCountry());
        
        // Only update password if provided and HASH IT
        if(userDetails.getPassword() != null && !userDetails.getPassword().isEmpty()){
//             Hash the new password before saving
            user.setPassword(passwordEncoder.encode(userDetails.getPassword()));
        }

        return userRepository.save(user);
    }
    
   

    // 6. Delete User
    public void deleteUser(Integer id) {
        if (userRepository.existsById(id)) {
            userRepository.deleteById(id);
        } else {
            throw new RuntimeException("User not found with id: " + id);
        }
    }
    

    // 7. Update Status (Block/Unblock)
    public void updateStatus(Integer id, String status) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        
        user.setStatus(status);
        userRepository.save(user);
    }
}