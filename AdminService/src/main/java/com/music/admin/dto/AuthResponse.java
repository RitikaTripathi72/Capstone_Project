package com.music.admin.dto;

public class AuthResponse {
    
    private String token;
    private Integer adminId;
    private String userName;
    private String adminName;
    private String email;
    private String adminStatus;

    // Constructors
    public AuthResponse() {}

    public AuthResponse(String token, Integer adminId, String userName,
                       String adminName, String email, String adminStatus) {
        this.token = token;
        this.adminId = adminId;
        this.userName = userName;
        this.adminName = adminName;
        this.email = email;
        this.adminStatus = adminStatus;
    }

    // Getters and Setters
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(String adminStatus) {
        this.adminStatus = adminStatus;
    }
}
