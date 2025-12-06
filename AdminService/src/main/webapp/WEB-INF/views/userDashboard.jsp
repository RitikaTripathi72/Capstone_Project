<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard - Music Library</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script src="https://unpkg.com/@phosphor-icons/web"></script>

<style>

:root {
    
    --bg-body: #F3F4F6;
    --bg-card: #FFFFFF;
    
    --text-main: #1F2937;
    --text-muted: #6B7280;
    
    --c-primary: #6366F1;     
    --c-secondary: #F43F5E;   
    --c-tertiary: #10B981;    
    
    --bg-primary-soft: #EEF2FF;
    --bg-secondary-soft: #FFF1F2;
    --bg-tertiary-soft: #ECFDF5;
    
   
    --grad-primary: linear-gradient(135deg, #6366F1, #8B5CF6);
    
    
    --radius-card: 24px;
    --radius-btn: 12px;
    --shadow-card: 0 10px 20px -5px rgba(0, 0, 0, 0.08), 0 4px 6px -2px rgba(0, 0, 0, 0.04);
    --shadow-hover: 0 20px 30px -5px rgba(0, 0, 0, 0.12), 0 10px 10px -5px rgba(0, 0, 0, 0.05);
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
    background: rgba(255, 255, 255, 0.95);
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

.brand i {
    color: var(--c-primary);
    font-size: 28px;
}

.nav-btn {
    background: white;
    color: var(--text-muted);
    border: 1px solid #E5E7EB;
    padding: 10px 20px;
    border-radius: var(--radius-btn);
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
    transition: all 0.2s;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
}

.nav-btn:hover {
    border-color: var(--c-secondary);
    color: var(--c-secondary);
    background: var(--bg-secondary-soft);
}

.container {
    max-width: 1100px;
    margin: 60px auto;
    padding: 20px;
    text-align: center;
}

h1 {
    font-size: 42px;
    font-weight: 900;
    margin-bottom: 12px;
    color: var(--text-main);
    letter-spacing: -1px;
}

#userName {
    
    background: var(--grad-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: var(--c-primary); 
    display: inline-block;
}

.subtitle {
    font-size: 18px;
    color: var(--text-muted);
    margin-bottom: 60px;
    font-weight: 500;
}


.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 32px;
}

.card {
    background: var(--bg-card);
    padding: 48px 32px;
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: 1px solid #FFFFFF;
    text-decoration: none;
    color: var(--text-main);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    position: relative;
    overflow: hidden;
    
    border-top: 6px solid transparent; 
}


.card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-hover);
}

.icon-box {
    width: 80px;
    height: 80px;
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    margin-bottom: 24px;
    transition: 0.3s;
    border: 1px solid rgba(0,0,0,0.03);
}

.c-library { border-top-color: var(--c-primary); }
.c-library .icon-box { background: var(--bg-primary-soft); color: var(--c-primary); }
.c-library:hover .icon-box { background: var(--c-primary); color: white; box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3); }

.c-collection { border-top-color: var(--c-tertiary); }
.c-collection .icon-box { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }
.c-collection:hover .icon-box { background: var(--c-tertiary); color: white; box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3); }

.c-profile { border-top-color: var(--c-secondary); }
.c-profile .icon-box { background: var(--bg-secondary-soft); color: var(--c-secondary); }
.c-profile:hover .icon-box { background: var(--c-secondary); color: white; box-shadow: 0 10px 20px rgba(244, 63, 94, 0.3); }


.title {
    font-size: 22px;
    font-weight: 700;
    margin-bottom: 12px;
    color: var(--text-main);
}

.desc {
    font-size: 15px;
    color: var(--text-muted);
    line-height: 1.6;
}

/* Mobile Responsive */
@media(max-width: 768px){
    .navbar { padding: 0 20px; height: 64px; }
    h1 { font-size: 32px; }
    .subtitle { font-size: 16px; margin-bottom: 40px; }
    .card-grid { grid-template-columns: 1fr; }
}
</style>
</head>

<body>


<div class="navbar">
    <div class="brand">
        <i class="ph-fill ph-music-notes-simple"></i>
        <span>User Dashboard</span>
    </div>
    <button onclick="logout()" class="nav-btn">
        <i class="ph-bold ph-sign-out"></i> Logout
    </button>
</div>

<div class="container">
    <h1>Welcome back, <span id="userName">User</span>!</h1>
    <p class="subtitle">What would you like to listen to today?</p>

    <div class="card-grid">
        
        <a href="/user/library" class="card c-library">
            <div class="icon-box">
                <i class="ph-fill ph-music-notes-plus"></i>
            </div>
            <div class="title">Browse Library</div>
            <div class="desc">Discover new songs and add fresh music to your playlists.</div>
        </a>

        <a href="/user/playlists" class="card c-collection">
            <div class="icon-box">
                <i class="ph-fill ph-playlist"></i>
            </div>
            <div class="title">My Collection</div>
            <div class="desc">View your personal playlists and favorite tracks.</div>
        </a>

        <a href="/user/profile" class="card c-profile">
            <div class="icon-box">
                <i class="ph-fill ph-user-circle"></i>
            </div>
            <div class="title">My Profile</div>
            <div class="desc">Update your personal details and account settings.</div>
        </a>

    </div>
</div>

<script>
    // 1. Get User Data safely
    try {
        var user = JSON.parse(localStorage.getItem('user'));

        // 2. Safety Check (Redirect if no user data)
        if(!user) {
            window.location.href = '/login';
        } else {
            // 3. Robust Name Extraction
            // Checks for 'firstName', then 'userName', then nested 'user.firstName'
            var displayName = "User";
            
            if (user.firstName) {
                displayName = user.firstName;
            } else if (user.userName) {
                displayName = user.userName;
            } else if (user.user && user.user.firstName) {
                displayName = user.user.firstName;
            } else if (user.name) {
                displayName = user.name;
            }

            document.getElementById('userName').textContent = displayName;
        }
    } catch(e) {
        console.error("Error parsing user data", e);
        // Fallback or redirect could go here
    }

    // 4. Logout Function
    function logout() {
        localStorage.removeItem('user');
        document.cookie = "jwtToken=; path=/; max-age=0";
        window.location.href = '/';
    }
</script>

</body>
</html>


