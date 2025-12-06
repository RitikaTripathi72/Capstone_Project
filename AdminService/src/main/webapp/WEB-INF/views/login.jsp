<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<!-- Phosphor Icons -->
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
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 16px;
    --radius-input: 8px;
    --shadow-card: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
   
    background: linear-gradient(to bottom, #E0E7FF 0%, #F3F4F6 30%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    color: var(--text-main);
}

.card {
    width: 100%;
    max-width: 440px;
    background: var(--bg-card);
    padding: 48px 40px;
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
    letter-spacing: -0.025em;
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
    padding: 12px 14px 12px 42px; 
    border-radius: var(--radius-input);
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
    transform: translateY(-1px);
}

input:focus + i {
    color: var(--c-primary);
}

.btn {
    width: 100%;
    padding: 14px;
    background: var(--text-main); 
    border: none;
    border-radius: var(--radius-input);
    font-size: 15px;
    font-weight: 600;
    color: white;
    cursor: pointer;
    transition: all 0.2s;
    margin-top: 10px;
    display: flex; justify-content: center; align-items: center; gap: 8px;
}

.btn:hover {
    background: var(--c-primary); 
    transform: translateY(-2px);
    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.3);
}

.message {
    padding: 12px;
    border-radius: var(--radius-input);
    text-align: center;
    font-size: 14px;
    font-weight: 500;
    display: none;
    margin-bottom: 20px;
}
.error { background: #FEF2F2; color: #991B1B; border: 1px solid #FECACA; }

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
    color: var(--c-hover);
}

.divider {
    height: 1px;
    background: #E5E7EB;
    margin: 20px 0;
}
</style>
</head>

<body>

<div class="card">
    
    <div class="card-header">
        <div class="logo-icon">
            <i class="ph-fill ph-music-note"></i>
        </div>
        <h2>Welcome Back</h2>
        <p class="subtitle">Please enter your details to sign in.</p>
    </div>

    <div id="message" class="message"></div>

    <form id="loginForm" onsubmit="handleLogin(event)">

        <div class="form-group">
            <label>Username</label>
            <div class="input-wrapper">
                <input type="text" name="userName" id="userName" required placeholder="Enter username">
              
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-wrapper">
                <input type="password" name="password" id="password" required placeholder="••••••••">
                
            </div>
        </div>

        <button type="submit" class="btn">
            Sign In 
        </button>
    </form>

    <div class="footer-links">
        Don't have an account? <a href="/register">Register here</a>
        <div class="divider"></div>
        <a href="/" style="color:var(--text-muted); font-weight:500;">
            <i class="ph-bold ph-house" style="vertical-align:middle;"></i> Back to Home
        </a>
    </div>
</div>

<script>
async function handleLogin(e) {
    // 2. This prevents the browser from putting password in URL
    e.preventDefault();

    const userName = document.getElementById('userName').value;
    const password = document.getElementById('password').value;
    const msg = document.getElementById('message');
    
    // Button loading state
    const btn = document.querySelector('button[type="submit"]');
    const originalBtnText = btn.innerHTML;
    btn.innerHTML = '<i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite"></i> Signing In...';
    btn.disabled = true;
    msg.style.display = 'none';

    // Prepare Data
    const data = { userName: userName, password: password };

    try {
        // 3. Send Request to USER SERVICE (Port 8081)
        const res = await fetch('http://localhost:8081/api/users/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });

        if (res.ok) {
            const responseData = await res.json();
            
            // 4. CRITICAL FIX: Save Token to COOKIE (Required for JSP Pages)
            // This allows the Admin Service backend to read the token when you load the dashboard
            document.cookie = "jwtToken=" + responseData.jwt + "; path=/; max-age=36000;";
            
            // Also save to LocalStorage for JS usage
            localStorage.setItem('user', JSON.stringify(responseData));

            msg.className = 'message'; // reset class
            // Success styling manually applied or could define .success in CSS if needed, 
            // but redirect happens fast usually.
            
            // 5. Redirect to Dashboard
            window.location.href = '/user/dashboard';
        } else {
            const text = await res.text();
            msg.className = 'message error';
            msg.innerHTML = '<i class="ph-bold ph-warning-circle"></i> Login Failed: ' + text;
            msg.style.display = 'block';
            
            // Reset button
            btn.innerHTML = originalBtnText;
            btn.disabled = false;
        }
    } catch (err) {
        msg.className = 'message error';
        msg.innerHTML = '<i class="ph-bold ph-warning-circle"></i> Error: Make sure User Service (8081) is running!';
        msg.style.display = 'block';
        console.error(err);
        
        // Reset button
        btn.innerHTML = originalBtnText;
        btn.disabled = false;
    }
}
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>