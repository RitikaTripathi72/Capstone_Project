package com.music.admin.config;

import com.music.admin.filters.JwtRequestFilter;
import jakarta.servlet.DispatcherType; // 👈 CRITICAL IMPORT FOR JSP
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Disable CSRF since we use JWT
            .authorizeHttpRequests(auth -> auth
                // 1. ALLOW INTERNAL FORWARDS (Fixes the Redirect Loop issue with JSPs)
                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                
                // 2. ALLOW PUBLIC PAGES (Fixes the 403 Forbidden on Home Page)
                .requestMatchers(
                	    "/", 
                	    "/login", 
                	    "/register", 
                	    "/admin/login", 
                	    "/admin/register", // 👈 ADD THIS!
                	    "/css/**", 
                	    "/js/**", 
                	    "/images/**"
                	).permitAll()
                
                // 3. ALLOW PUBLIC APIs (So frontend fetch() requests work)
                .requestMatchers(
                    "/api/admin/login", 
                    "/api/admin/register",
                    "/api/songs/all", // Allow users to see songs without admin login
                    "/api/songs/search"
                ).permitAll()

                // 4. EVERYTHING ELSE REQUIRES LOGIN
                .anyRequest().authenticated()
            )
            // 5. STATELESS SESSION (No JSESSIONID)
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )
            // 6. ADD JWT FILTER
            .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
    
    // Export AuthenticationManager (Optional, but good practice)
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}