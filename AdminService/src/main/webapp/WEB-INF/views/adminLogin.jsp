<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - Admin Studio</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script src="https://unpkg.com/@phosphor-icons/web"></script>

<style>


:root {
    
    --bg-body: #F3F4F6;
    --bg-card: #FFFFFF;
    
    --text-main: #1F2937;
    --text-muted: #6B7280;
    
    --c-primary: #6366F1;       
    --bg-primary-soft: #EEF2FF;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --shadow-card: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
    
    --radius-card: 24px;
    --radius-input: 12px;
    --radius-btn: 12px;
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    background-image: radial-gradient(#E5E7EB 1px, transparent 1px);
    background-size: 24px 24px;
    
    color: var(--text-main);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.login-container {
    width: 100%;
    max-width: 440px;
    background: var(--bg-card);
    padding: 48px 40px;
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: 1px solid #FFFFFF;
    animation: slideUp 0.5s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.login-header {
    text-align: center;
    margin-bottom: 32px;
}

.logo-icon {
    width: 56px; height: 56px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    border-radius: 16px;
    display: flex; align-items: center; justify-content: center;
    font-size: 28px;
    margin: 0 auto 16px;
}

h2 {
    font-size: 24px;
    font-weight: 800;
    color: var(--text-main);
    margin-bottom: 8px;
}

.subtitle {
    font-size: 14px;
    color: var(--text-muted);
}

.form-group {
    margin-bottom: 20px;
}

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
    left: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--text-muted);
    font-size: 18px;
    pointer-events: none;
    transition: 0.2s;
}

input {
    width: 100%;
    padding: 14px 14px 14px 42px; 
    border-radius: var(--radius-input);
    border: 1px solid #E5E7EB;
    background: #F9FAFB;
    font-size: 15px;
    color: var(--text-main);
    transition: all 0.2s;
}

input:focus {
    outline: none;
    background: white;
    border-color: var(--c-primary);
    box-shadow: 0 0 0 4px var(--bg-primary-soft);
}

input:focus + i {
    color: var(--c-primary);
}


.btn {
    width: 100%;
    padding: 14px;
    background: var(--grad-primary);
    color: white;
    border: none;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    margin-top: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
}

.footer-links {
    margin-top: 24px;
    text-align: center;
    font-size: 14px;
    color: var(--text-muted);
}

.footer-links a {
    color: var(--c-primary);
    font-weight: 600;
    text-decoration: none;
    transition: 0.2s;
}

.footer-links a:hover {
    text-decoration: underline;
}

.divider {
    height: 1px;
    background: #E5E7EB;
    margin: 20px 0;
}


.message {
    padding: 12px;
    border-radius: var(--radius-input);
    margin-bottom: 20px;
    display: none;
    text-align: center;
    font-size: 14px;
    font-weight: 500;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.message.error {
    background: #FEF2F2;
    color: #DC2626;
    border: 1px solid #FECACA;
}

</style>
</head>

<body>

<div class="login-container">
    
    <div class="login-header">
        <div class="logo-icon">
            <i class="ph-fill ph-music-notes-simple"></i>
        </div>
        <h2>Admin Studio</h2>
        <p class="subtitle">Enter your credentials to access the dashboard</p>
    </div>

    <div id="message" class="message" style="display:none;"></div>

    <form id="adminLoginForm">
        <div class="form-group">
            <label>Username</label>
            <div class="input-wrapper">
                <input type="text" name="userName" required placeholder="Enter admin username">
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-wrapper">
                <input type="password" name="password" required placeholder="••••••••">
            </div>
        </div>

        <button type="submit" class="btn">
            Sign In <i class="ph-bold ph-arrow-right"></i>
        </button>
    </form>

    <div class="footer-links">
        Don't have an account? <a href="/admin/register">Register here</a>
        <div class="divider"></div>
        <a href="/" style="color:var(--text-muted); font-weight:500;">
            <i class="ph-bold ph-house" style="vertical-align:middle;"></i> Back to Home
        </a>
    </div>

</div>

<script>
document.getElementById('adminLoginForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const loginData = {
        userName: this.userName.value,
        password: this.password.value
    };

    const messageDiv = document.getElementById('message');
    // Reset previous messages
    messageDiv.style.display = 'none';

    // Show loading state on button
    const btn = this.querySelector('button');
    const originalBtnText = btn.innerHTML;
    btn.innerHTML = '<i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite"></i> Signing in...';
    btn.disabled = true;

    try {
        const response = await fetch("http://localhost:8082/api/admin/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(loginData)
        });

        if (response.ok) {
            const data = await response.json(); // This contains { token: "...", admin: {...} }
            
            // 1. CRITICAL FIX: Set the Cookie so you don't get 403 on Dashboard
            document.cookie = "jwtToken=" + data.token + "; path=/; max-age=36000;";

            // 2. CRITICAL FIX: Save ONLY the admin object to localStorage
            localStorage.setItem("admin", JSON.stringify(data.admin));

            window.location.href = "/admin/dashboard";
        } else {
            const err = await response.text();
            messageDiv.className = "message error";
            messageDiv.innerHTML = '<i class="ph-bold ph-warning-circle"></i> ' + err;
            messageDiv.style.display = "flex";
            
            // Reset button
            btn.innerHTML = originalBtnText;
            btn.disabled = false;
        }

    } catch (error) {
        messageDiv.className = "message error";
        messageDiv.innerHTML = '<i class="ph-bold ph-warning-circle"></i> Connection Error: Is the backend running?';
        messageDiv.style.display = "flex";
        
        // Reset button
        btn.innerHTML = originalBtnText;
        btn.disabled = false;
    }
});
</script>

<style>
    @keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>
