<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Music Library - Home</title>

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
    
    --c-accent: #F43F5E;      
    --bg-accent-soft: #FFF1F2;
    
    --bg-primary-soft: #EEF2FF;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 24px;
    --radius-btn: 12px;
    --shadow-card: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    background-image: radial-gradient(#E5E7EB 1px, transparent 1px);
    background-size: 24px 24px;
    
    color: var(--text-main);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.navbar {
    height: 72px;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(12px);
    padding: 0 40px;
    display: flex;
    align-items: center;
    justify-content: center; 
    border-bottom: 1px solid #E5E7EB;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 10;
}

.navbar h2 {
    font-size: 22px;
    font-weight: 800;
    color: var(--text-main);
    letter-spacing: -0.5px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.center-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    margin-top: 72px; 
}

.card {
    width: 100%;
    max-width: 480px;
    background: var(--bg-card);
    padding: 48px 40px;
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: none;
    text-align: center;
    
    border-top: 6px solid var(--c-primary);
    
    animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.hero-icon {
    width: 72px; height: 72px;
    background: var(--bg-accent-soft); 
    color: var(--c-accent);            
    border-radius: 20px;
    display: flex; align-items: center; justify-content: center;
    font-size: 36px;
    margin: 0 auto 24px;
    box-shadow: 0 8px 20px rgba(244, 63, 94, 0.15); 
}

h1 {
    font-size: 26px;
    font-weight: 800;
    color: var(--text-main);
    margin-bottom: 12px;
    letter-spacing: -0.5px;
}

p {
    font-size: 15px;
    color: var(--text-muted);
    line-height: 1.5;
    margin-bottom: 32px;
}

.btn {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 14px 24px;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.2s ease;
    margin-bottom: 12px;
    cursor: pointer;
    border: none;
    gap: 8px;
}

.btn-primary {
    background: var(--grad-primary);
    color: white;
    box-shadow: 0 4px 12px rgba(99, 102, 241, 0.25);
}
.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(99, 102, 241, 0.35);
}

.btn-secondary {
    background: white;
    color: var(--c-accent); 
    border: 1px solid #FECDD3; 
}
.btn-secondary:hover {
    border-color: var(--c-accent);
    background: var(--bg-accent-soft);
    color: var(--c-accent);
    transform: translateY(-2px);
}

</style>
</head>

<body>

<div class="navbar">
    <h2>🎵 Music Library</h2>
</div>

<div class="center-wrapper">
    <div class="card">
        
        <div class="hero-icon">
            <i class="ph-fill ph-music-notes-simple"></i>
        </div>

        <h1>Welcome to Music Library</h1>
        <p>Your music management platform is live and ready!</p>

        <a href="/login" class="btn btn-primary">
            User Login
        </a>
        
        <a href="/admin/login" class="btn btn-secondary">
            Admin Login
        </a>
    </div>
</div>

</body>
</html>
