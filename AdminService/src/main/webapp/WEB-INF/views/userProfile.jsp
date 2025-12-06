<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile - Music Library</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script src="https://unpkg.com/@phosphor-icons/web"></script>

<style>

:root {
    
    --bg-body: #F3F4F6;
    --bg-card: #FFFFFF;
    
    --text-main: #1F2937;
    --text-muted: #6B7280;
    
    --c-primary: #6366F1;    
    --c-hover: #4F46E5;       
    --c-secondary: #F43F5E;   
    --bg-primary-soft: #EEF2FF;
    --bg-secondary-soft: #FFF1F2;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 20px;
    --radius-btn: 10px;
    --shadow-card: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    background-image: radial-gradient(#E5E7EB 1px, transparent 1px);
    background-size: 24px 24px;
    
    color: var(--text-main);
    min-height: 100vh;
}

.navbar {
    height: 72px;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(12px);
    padding: 0 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #E5E7EB;
    position: sticky;
    top: 0;
    z-index: 100;
}

.brand {
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 20px;
    font-weight: 800;
    color: var(--text-main);
}
.brand i { color: var(--c-primary); font-size: 28px; }

.nav-btn {
    background: white;
    color: var(--text-muted);
    border: 1px solid #E5E7EB;
    padding: 8px 16px;
    border-radius: var(--radius-btn);
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
    transition: all 0.2s;
    display: flex; align-items: center; gap: 8px;
}

.nav-btn:hover {
    border-color: var(--c-primary);
    color: var(--c-primary);
    background: var(--bg-primary-soft);
}

.container {
    max-width: 700px;
    margin: 40px auto;
    padding: 20px;
}

.profile-card {
    background: var(--bg-card);
    padding: 48px;
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: none;
    border-top: 6px solid var(--c-primary);
    animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.card-header {
    text-align: center;
    margin-bottom: 40px;
}

.header-icon {
    width: 64px; height: 64px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-size: 32px;
    margin: 0 auto 16px;
}

h2 {
    font-size: 28px;
    font-weight: 800;
    color: var(--text-main);
    margin-bottom: 8px;
    letter-spacing: -0.5px;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
}

.form-group { margin-bottom: 0; }
.full-width { grid-column: span 2; }

label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 8px;
}

.input-wrapper {
    position: relative;
}

.input-wrapper i {
    position: absolute;
    left: 14px; top: 50%;
    transform: translateY(-50%);
    color: var(--text-muted);
    font-size: 18px;
    pointer-events: none;
}

input {
    width: 100%;
    padding: 12px 14px 12px 42px; 
    border-radius: var(--radius-btn);
    border: 1px solid #E5E7EB;
    background: #FFFFFF;
    font-size: 14px;
    color: var(--text-main);
    transition: all 0.2s ease;
}

input:focus {
    background: #FFFFFF;
    border-color: var(--c-primary);
    box-shadow: 0 4px 12px rgba(99, 102, 241, 0.15); 
    outline: none;
}

input:disabled {
    background: #F9FAFB;
    color: var(--text-muted);
}

.divider {
    grid-column: span 2;
    border-top: 1px solid #E5E7EB;
    margin: 10px 0;
    padding-top: 20px;
    font-size: 12px;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 1px;
}

.btn-save {
    grid-column: span 2;
    width: 100%;
    padding: 14px;
    background: var(--grad-primary);
    color: white;
    border: none;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    margin-top: 20px;
    display: flex; align-items: center; justify-content: center; gap: 8px;
}

.btn-save:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(99, 102, 241, 0.3);
}

@media(max-width: 600px){
    .form-grid { grid-template-columns: 1fr; }
    .full-width { grid-column: span 1; }
    .profile-card { padding: 30px 20px; }
}
</style>
</head>
<body>

<div class="navbar">
    <div class="brand">
        <i class="ph-fill ph-user-circle"></i>
        <span>My Profile</span>
    </div>
    <div class="nav-links">
        <a href="/user/dashboard" class="nav-btn">
            <i class="ph-bold ph-house"></i> Dashboard
        </a>
    </div>
</div>

<div class="container">
    <div class="profile-card">
        
        <div class="card-header">
            <div class="header-icon">
                <i class="ph-fill ph-user-gear"></i>
            </div>
            <h2>Edit Profile</h2>
            <p style="color:var(--text-muted); font-size:14px;">Update your personal information</p>
        </div>

        <div class="form-grid">
            
            <div class="form-group">
                <label>First Name</label>
                <div class="input-wrapper">
                    <input type="text" id="firstName">
                    <i class="ph-bold ph-user"></i>
                </div>
            </div>

            <div class="form-group">
                <label>Last Name</label>
                <div class="input-wrapper">
                    <input type="text" id="lastName">
                    <i class="ph-bold ph-user"></i>
                </div>
            </div>

            <div class="form-group full-width">
                <label>Email Address</label>
                <div class="input-wrapper">
                    <input type="email" id="email">
                    <i class="ph-bold ph-envelope-simple"></i>
                </div>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <div class="input-wrapper">
                    <input type="text" id="mobile">
                    <i class="ph-bold ph-phone"></i>
                </div>
            </div>

            <div class="form-group">
                <label>City</label>
                <div class="input-wrapper">
                    <input type="text" id="city">
                    <i class="ph-bold ph-buildings"></i>
                </div>
            </div>

            <div class="form-group full-width">
                <label>Country</label>
                <div class="input-wrapper">
                    <input type="text" id="country">
                    <i class="ph-bold ph-globe"></i>
                </div>
            </div>
            
            <div class="divider">Security</div>

            <div class="form-group full-width">
                <label style="color:var(--c-secondary);">Change Password (Optional)</label>
                <div class="input-wrapper">
                    <input type="password" id="password" placeholder="Leave empty to keep current password">
                    <i class="ph-bold ph-lock-key"></i>
                </div>
            </div>

            <button class="btn-save" onclick="updateProfile()">
                <i class="ph-bold ph-check-circle"></i> Save Changes
            </button>

        </div>
    </div>
</div>

<script>
    // 1. AUTH CHECK
    var user = JSON.parse(localStorage.getItem('user'));
    if(!user || !user.userId) window.location.href = "/login";

    var USER_ID = user.userId;
    var JWT_TOKEN = user.jwt;
    var API_URL = "http://localhost:8081/api/users";

    // 2. Load Current Data
    async function loadProfile() {
        try {
            var res = await fetch(API_URL + "/" + USER_ID, {
                method: 'GET',
                headers: { 
                    'Authorization': 'Bearer ' + JWT_TOKEN,
                    'Content-Type': 'application/json' 
                }
            });
            
            if(!res.ok) { alert("Failed to load profile"); return; }

            var data = await res.json();

            // Populate Fields
            document.getElementById("firstName").value = data.firstName;
            document.getElementById("lastName").value = data.lastName;
            document.getElementById("email").value = data.email;
            document.getElementById("mobile").value = data.mobile || "";
            document.getElementById("city").value = data.city || "";
            document.getElementById("country").value = data.country || "";
        } catch(e) { console.error(e); }
    }

    // 3. Update Data
    async function updateProfile() {
        var btn = document.querySelector('.btn-save');
        var originalText = btn.innerHTML;
        btn.innerHTML = '<i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite"></i> Saving...';
        btn.disabled = true;

        var updatedData = {
            firstName: document.getElementById("firstName").value,
            lastName: document.getElementById("lastName").value,
            email: document.getElementById("email").value,
            mobile: document.getElementById("mobile").value,
            city: document.getElementById("city").value,
            country: document.getElementById("country").value,
            password: document.getElementById("password").value 
        };

        try {
            var res = await fetch(API_URL + "/" + USER_ID, {
                method: 'PUT',
                headers: {
                    'Authorization': 'Bearer ' + JWT_TOKEN,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(updatedData)
            });

            if(res.ok) {
                // Update LocalStorage name
                var newUserResponse = await res.json();
                
                // Handle different response structures if needed, but usually returns updated user obj
                if(newUserResponse.firstName) {
                    user.firstName = newUserResponse.firstName;
                    user.lastName = newUserResponse.lastName;
                    // Important: Merge updates, don't overwrite token
                    localStorage.setItem('user', JSON.stringify(user)); 
                }
                
                alert("Profile Updated Successfully!");
                window.location.href = "/user/dashboard";
            } else {
                alert("Failed to update profile.");
                btn.innerHTML = originalText;
                btn.disabled = false;
            }
        } catch(e) { 
            console.error(e); 
            btn.innerHTML = originalText;
            btn.disabled = false;
        }
    }

    loadProfile();
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>