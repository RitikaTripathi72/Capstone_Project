package com.music.user.service;

import com.music.user.entity.User;
import com.music.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // We use the custom findByUserName method we created in the repository
        User user = userRepository.findByUserName(username);
        
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        
        // Return Spring Security's UserDetails object
        return new org.springframework.security.core.userdetails.User(
                user.getUserName(), 
                user.getPassword(), 
                Collections.emptyList() // No specific roles needed for now
        );
    }
}