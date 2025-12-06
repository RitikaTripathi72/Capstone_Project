<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Song - Admin Studio</title>

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
    
    --shadow-card: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    --radius-l: 16px;            
    --radius-btn: 8px;
    --radius-input: 8px;
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
.panel-nav a:hover { background-color: #F9FAFB; color: var(--text-main); }


.panel-nav a.active {
    color: var(--c-primary);
    background: var(--bg-primary-soft);
    font-weight: 600;
}

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
    display: flex; align-items: center; justify-content: space-between;
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
    display: flex;
    justify-content: center; 
}


.form-card {
    background: var(--bg-card);
    width: 100%;
    max-width: 700px;
    padding: 40px;
    border-radius: var(--radius-l);
    box-shadow: var(--shadow-card);
    border: 1px solid #E5E7EB;
}

.form-header {
    margin-bottom: 32px;
    text-align: center;
}

.form-header h2 {
    font-size: 24px;
    font-weight: 800;
    color: var(--text-main);
    margin-bottom: 8px;
}

.form-header p {
    color: var(--text-muted);
    font-size: 14px;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr; 
    gap: 24px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.full-width {
    grid-column: span 2;
}

label {
    font-size: 13px;
    font-weight: 600;
    color: var(--text-main);
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

input, select {
    width: 100%;
    padding: 12px 16px;
    border-radius: var(--radius-input);
    border: 1px solid #E5E7EB;
    font-size: 14px;
    background: #F9FAFB;
    color: var(--text-main);
    transition: all 0.2s;
}

input:focus, select:focus {
    outline: none;
    border-color: var(--c-primary);
    background: #FFFFFF;
    box-shadow: 0 0 0 3px var(--bg-primary-soft);
}


input[type="file"] {
    padding: 10px;
    background: white;
    border: 1px dashed #D1D5DB;
    cursor: pointer;
}
input[type="file"]:hover {
    background: #F9FAFB;
    border-color: var(--c-primary);
}


.submit-btn {
    grid-column: span 2;
    margin-top: 16px;
    padding: 14px;
    background: var(--grad-primary);
    color: white;
    border: none;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.submit-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
}

.back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: var(--text-muted);
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 20px;
    transition: color 0.2s;
}
.back-link:hover {
    color: var(--c-primary);
}

@media (max-width: 768px) {
    .left-panel { width: 80px; padding: 24px 16px; }
    .panel-title, .logout-btn span, .panel-nav a span { display: none; }
    .panel-nav a { justify-content: center; }
    .panel-nav a i { font-size: 24px; }
    
    .header-strip { left: 80px; width: calc(100% - 80px); padding: 0 24px; }
    .main { margin-left: 80px; padding: 100px 24px 24px; }
    
    .form-grid { grid-template-columns: 1fr; } /* Stack inputs on mobile */
    .full-width { grid-column: span 1; }
}
</style>
</head>
<body>

<div class="header-strip">
    <div class="header-title">
        <i class="ph-bold ph-music-notes-plus"></i> Add New Song
    </div>
</div>


<div class="left-panel">
    <div class="panel-title">Main Menu</div>

    <div class="panel-nav">
       
        <a href="/admin/add-song" class="active">
            <i class="ph ph-music-notes-plus"></i>
            <span>Add Song</span>
        </a>
        <a href="/admin/songs">
            <i class="ph ph-playlist"></i>
            <span>All Songs</span>
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

    <div class="form-card">
        <a href="/admin/dashboard" class="back-link">
            <i class="ph-bold ph-arrow-left"></i> Back to Dashboard
        </a>

        <div class="form-header">
            <h2>Track Details</h2>
            <p>Fill in the information below to upload a new track to the library.</p>
        </div>

        <form action="/admin/songs/add" method="post" enctype="multipart/form-data" class="form-grid">

            <div class="form-group">
                <label>Song ID <span style="color:var(--c-secondary)">*</span></label>
                <input type="text" name="songId" required placeholder="e.g. SONG001">
            </div>

            <div class="form-group">
                <label>Song Name <span style="color:var(--c-secondary)">*</span></label>
                <input type="text" name="songName" required placeholder="Track title">
            </div>

            <div class="form-group">
                <label>Music Director</label>
                <input type="text" name="musicDirector" placeholder="Composer name">
            </div>

            <div class="form-group">
                <label>Singer <span style="color:var(--c-secondary)">*</span></label>
                <input type="text" name="singer" required placeholder="Artist name">
            </div>

            <div class="form-group">
                <label>Release Date</label>
                <input type="date" name="releaseDate">
            </div>

            <div class="form-group">
                <label>Album Name</label>
                <input type="text" name="albumName" placeholder="Album title">
            </div>

            <div class="form-group">
                <label>Song Type <span style="color:var(--c-secondary)">*</span></label>
                <select name="songType" required>
                    <option value="FREE">FREE</option>
                    <option value="PREMIUM">PREMIUM</option>
                </select>
            </div>

            <div class="form-group">
                <label>Song Status <span style="color:var(--c-secondary)">*</span></label>
                <select name="songStatus" required>
                    <option value="AVAILABLE">AVAILABLE</option>
                    <option value="NOTAVAILABLE">NOT AVAILABLE</option>
                </select>
            </div>
             
            <div class="form-group full-width">
                <label>Upload MP3 File <span style="color:var(--c-secondary)">*</span></label>
                <input type="file" name="file" accept=".mp3, .wav" required />
            </div>

            <button type="submit" class="submit-btn">
                <i class="ph-bold ph-upload-simple"></i> Upload Song
            </button>
        </form>

    </div>
</div>

<script>
    function logout(){
        localStorage.removeItem('admin');
        document.cookie = "jwtToken=; path=/; max-age=0";
        window.location.href='/admin/login';
    }
</script>

</body>
</html>