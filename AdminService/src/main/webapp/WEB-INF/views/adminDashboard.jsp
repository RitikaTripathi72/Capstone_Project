<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;800&display=swap" rel="stylesheet">
<script src="https://unpkg.com/@phosphor-icons/web"></script>

<style>

:root {
    
    --bg-body: #F3F4F6;
    --bg-sidebar: #FFFFFF;
    --bg-card: #FFFFFF;
    
    --text-main: #1F2937;
    --text-muted: #6B7280;
    
    
    --c-primary: #6366F1;       
    --bg-primary-soft: #EEF2FF;
    
    --c-secondary: #F43F5E;     
    --bg-secondary-soft: #FFF1F2;
    
    --c-tertiary: #10B981;      
    --bg-tertiary-soft: #ECFDF5;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    --grad-secondary: linear-gradient(135deg, #F43F5E, #E11D48);
    --grad-tertiary: linear-gradient(135deg, #10B981, #059669);
    
    --shadow-card: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    --shadow-hover: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
    
    --radius-l: 16px;            
    --radius-btn: 8px;
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    color: var(--text-main);
    display: flex;
    min-height: 100vh;
    overflow-x: hidden;
}


.left-panel {
    position: fixed;
    left: 0; top: 0;
    width: 260px; height: 100vh;
    background: var(--bg-sidebar);
    padding: 32px 24px;
    display: flex; flex-direction: column;
    z-index: 100;
    border-right: 1px solid #E5E7EB;
}

.panel-title {
    font-size: 11px; text-transform: uppercase; letter-spacing: 1.2px;
    color: var(--text-muted); font-weight: 800;
    margin-bottom: 24px; margin-top: 40px; 
}

/* Nav Links with Icons */
.panel-nav a {
    display: flex; align-items: center; gap: 12px;
    padding: 12px 16px;
    color: var(--text-muted);
    text-decoration: none; font-weight: 500; font-size: 14px;
    border-radius: var(--radius-btn);
    margin-bottom: 8px;
    transition: all 0.2s ease;
}

.panel-nav a i { font-size: 20px; transition: 0.2s; }

/* Hover States */
.panel-nav a:hover { background-color: #F9FAFB; color: var(--text-main); }

/* Active Colors per item */
.panel-nav a:nth-child(1):hover { color: var(--c-primary); background: var(--bg-primary-soft); }
.panel-nav a:nth-child(2):hover { color: var(--c-tertiary); background: var(--bg-tertiary-soft); } /* Swapped to match cards */
.panel-nav a:nth-child(3):hover { color: var(--c-secondary); background: var(--bg-secondary-soft); }

.logout-btn {
    margin-top: auto; 
    background: #FFFFFF; color: var(--text-muted);
    border: 1px solid #E5E7EB;
    padding: 12px;
    border-radius: var(--radius-btn);
    font-weight: 600; font-size: 13px;
    cursor: pointer;
    display: flex; align-items: center; justify-content: center; gap: 8px;
    transition: all 0.2s;
}
.logout-btn:hover {
    border-color: var(--c-secondary); color: var(--c-secondary); background: var(--bg-secondary-soft);
}

.header-strip {
    position: fixed; top: 0; left: 260px;
    width: calc(100% - 260px); height: 72px;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px);
    display: flex; align-items: center; gap: 12px;
    padding: 0 48px; z-index: 90;
    border-bottom: 1px solid rgba(229, 231, 235, 0.5);
}

.header-title {
    font-size: 20px; font-weight: 700; color: var(--text-main);
    display: flex; align-items: center; gap: 10px;
}
.header-title i { color: var(--c-primary); font-size: 24px; }

.main {
    margin-left: 260px; flex: 1;
    padding: 112px 48px 48px; 
}

.welcome-box { margin-bottom: 48px; }
.welcome-box h3 { font-size: 32px; font-weight: 800; color: var(--text-main); margin-bottom: 8px; }
.welcome-box p { color: var(--text-muted); font-size: 16px; }


.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 32px;
}

.card {
    background: var(--bg-card);
    padding: 32px;
    border-radius: var(--radius-l);
    border: 1px solid #F3F4F6;
    box-shadow: var(--shadow-card);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    display: flex; flex-direction: column; justify-content: space-between;
    min-height: 260px;
    overflow: hidden; 
}

.card:nth-child(1) { --card-accent: var(--c-primary);   --card-bg: var(--bg-primary-soft);   --card-grad: var(--grad-primary); }
.card:nth-child(2) { --card-accent: var(--c-tertiary);  --card-bg: var(--bg-tertiary-soft);  --card-grad: var(--grad-tertiary); }
.card:nth-child(3) { --card-accent: var(--c-secondary); --card-bg: var(--bg-secondary-soft); --card-grad: var(--grad-secondary); }

.icon-badge {
    width: 48px; height: 48px;
    border-radius: 12px;
    background: var(--card-bg);
    color: var(--card-accent);
    display: flex; align-items: center; justify-content: center;
    font-size: 24px;
    margin-bottom: 20px;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-hover);
    border-color: rgba(0,0,0,0.02);
}

.card h3 { font-size: 20px; font-weight: 700; margin-bottom: 8px; color: var(--text-main); }
.card p { font-size: 15px; color: var(--text-muted); line-height: 1.6; margin-bottom: 32px; }

.btn {
    display: inline-flex; align-items: center; gap: 8px;
    background: var(--card-grad);
    color: white;
    padding: 12px 24px;
    border-radius: var(--radius-btn); 
    text-decoration: none; font-weight: 600; font-size: 14px;
    transition: all 0.2s;
    align-self: flex-start;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}
.btn:hover { transform: translateY(-2px); box-shadow: 0 8px 12px rgba(0,0,0,0.15); }

@media (max-width: 768px) {
    .left-panel { width: 80px; padding: 24px 16px; }
    .panel-title, .logout-btn span, .panel-nav a span { display: none; }
    
    .panel-nav a { justify-content: center; padding: 16px; }
    .panel-nav a i { font-size: 24px; }
    .logout-btn { justify-content: center; }
    
    .header-strip { left: 80px; width: calc(100% - 80px); padding: 0 24px; }
    .main { margin-left: 80px; padding: 100px 24px 24px; }
}
</style>
</head>
<body>


<div class="header-strip">
    <div class="header-title">
        <i class="ph-bold ph-faders"></i> Admin Studio
    </div>
</div>

<div class="left-panel">
    <div class="panel-title">Main Menu</div>

    <div class="panel-nav">
        <a href="/admin/add-song">
            <i class="ph ph-music-notes-plus"></i>
            <span>Add Song</span>
        </a>
        <a href="/admin/songs">
            <i class="ph ph-playlist"></i>
            <span>View Songs</span>
        </a>
        <a href="/admin/users">
            <i class="ph ph-users-three"></i>
            <span>Users</span>
        </a>
    </div>

    <button class="logout-btn" onclick="logout()">
        <i class="ph-bold ph-sign-out"></i>
        <span>Logout</span>
    </button>
</div>

<div class="main">

    <div class="welcome-box">
        <h3>Welcome back, <span id="adminName"></span></h3>
        <p>You are logged in as <span id="adminEmail" style="color: var(--c-primary); font-weight:600;"></span></p>
    </div>

    <div class="grid">

        <div class="card">
            <div>
                <div class="icon-badge"><i class="ph-fill ph-cloud-arrow-up"></i></div>
                <h3>Upload Track</h3>
                <p>Add new music tracks to the library.</p>
            </div>
            <a href="/admin/add-song" class="btn">
                Add New <i class="ph-bold ph-arrow-right"></i>
            </a>
        </div>

        <div class="card">
            <div>
                <div class="icon-badge"><i class="ph-fill ph-vinyl-record"></i></div>
                <h3>Library</h3>
                <p>Manage existing songs and albums.</p>
            </div>
            <a href="/admin/songs" class="btn">
                View All <i class="ph-bold ph-arrow-right"></i>
            </a>
        </div>

        <div class="card">
            <div>
                <div class="icon-badge"><i class="ph-fill ph-heart"></i></div>
                <h3>Community</h3>
                <p>Manage registered listeners.</p>
            </div>
            <a href="/admin/users" class="btn">
                Users <i class="ph-bold ph-arrow-right"></i>
            </a>
        </div>

    </div>
</div>

<script>
const storedData = localStorage.getItem('admin');

if(!storedData){
    window.location.href='/admin/login';
} else {
    const admin = JSON.parse(storedData);
    document.getElementById('adminName').textContent = admin.adminName || "Admin";
    document.getElementById('adminEmail').textContent = admin.email || "No Email";
}

function logout(){
    localStorage.removeItem('admin');
    document.cookie = "jwtToken=; path=/; max-age=0";
    window.location.href='/admin/login';
}
</script>

</body>
</html>

