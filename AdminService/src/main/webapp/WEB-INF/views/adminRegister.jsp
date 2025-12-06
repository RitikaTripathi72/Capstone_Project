<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Registration</title>
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
    --bg-secondary-soft: #FFF1F2;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 24px;
    --radius-btn: 12px;
    --shadow-card: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    /* Subtle background pattern */
    background-image: radial-gradient(#E5E7EB 1px, transparent 1px);
    background-size: 24px 24px;
    
    color: var(--text-main);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px 20px;
}

/* Main Card Container */
.card {
    width: 100%;
    max-width: 500px;
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
    width: 64px; height: 64px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    border-radius: 16px;
    display: flex; align-items: center; justify-content: center;
    font-size: 32px;
    margin: 0 auto 16px;
}

h2 {
    font-size: 24px;
    font-weight: 800;
    color: var(--text-main);
    margin-bottom: 8px;
    letter-spacing: -0.5px;
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
    left: 14px; top: 50%;
    transform: translateY(-50%);
    color: var(--text-muted);
    font-size: 18px;
    pointer-events: none;
    transition: 0.2s;
}

input {
    width: 100%;
    padding: 12px 14px 12px 42px; 
    border-radius: 10px;
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
    display: flex; justify-content: center; align-items: center; gap: 8px;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(99, 102, 241, 0.3);
}


.message {
    padding: 12px;
    border-radius: 10px;
    text-align: center;
    font-size: 14px;
    font-weight: 500;
    display: none;
    margin-bottom: 20px;
}
.error { background: #FEF2F2; color: #991B1B; border: 1px solid #FECACA; }
.success { background: #ECFDF5; color: #065F46; border: 1px solid #A7F3D0; }

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
.footer-links a:hover { text-decoration: underline; }

.divider {
    height: 1px;
    background: #E5E7EB;
    margin: 24px 0;
}
</style>
</head>
<body>

<div class="card">
    
    <div class="card-header">
        <div class="logo-icon">
            <i class="ph-fill ph-shield-check"></i>
        </div>
        <h2>Admin Registration</h2>
        <p class="subtitle">Create a new administrator account</p>
    </div>

    <div id="message" class="message"></div>

    <form id="adminRegisterForm">
        
        <div class="form-group">
            <label>Full Name</label>
            <div class="input-wrapper">
                <input type="text" name="adminName" required>
            </div>
        </div>

        <div class="form-group">
            <label>Username</label>
            <div class="input-wrapper">
                <input type="text" name="userName" required>
            </div>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <div class="input-wrapper">
                <input type="email" name="email" required>
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-wrapper">
                <input type="password" name="password" required>
            </div>
        </div>

        <div class="form-group">
            <label>Mobile Number</label>
            <div class="input-wrapper">
                <input type="text" name="mobileNo" required >
            </div>
        </div>

        <button type="submit" class="btn">
            Register Admin
        </button>
    </form>

    <div class="footer-links">
        <div class="divider"></div>
        Already have an account? <a href="/admin/login">Login here</a>
    </div>
</div>

<script>
document.getElementById('adminRegisterForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const msg = document.getElementById('message');
    const btn = this.querySelector('button');
    const originalText = btn.innerHTML;

    // Loading State
    btn.innerHTML = '<i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite"></i> Processing...';
    btn.disabled = true;
    msg.style.display = 'none';
    
    const data = {
        adminName: this.adminName.value,
        userName: this.userName.value,
        email: this.email.value,
        password: this.password.value,
        mobileNo: this.mobileNo.value
    };

    try {
        // Send to Admin Service Backend
        const res = await fetch('http://localhost:8082/api/admin/register', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        });

        if (res.ok) {
            msg.className = 'message success';
            msg.innerHTML = '<i class="ph-bold ph-check-circle"></i> Admin Registered Successfully! Redirecting...';
            msg.style.display = 'block';
            setTimeout(() => window.location.href = '/admin/login', 1500);
        } else {
            msg.className = 'message error';
            const errorText = await res.text();
            msg.innerHTML = '<i class="ph-bold ph-warning-circle"></i> ' + errorText;
            msg.style.display = 'block';
            btn.innerHTML = originalText;
            btn.disabled = false;
        }
    } catch (err) {
        msg.className = 'message error';
        msg.innerHTML = '<i class="ph-bold ph-warning-circle"></i> Error: ' + err.message;
        msg.style.display = 'block';
        btn.innerHTML = originalText;
        btn.disabled = false;
    }
});
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>