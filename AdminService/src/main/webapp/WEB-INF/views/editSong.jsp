<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Song - Admin Studio</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;800&display=swap" rel="stylesheet">
<!-- Phosphor Icons -->
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

.header-strip {
    position: fixed; top: 0; left: 0;
    width: 100%; height: 72px;
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
    margin-left: 0; 
    flex: 1;
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

.current-file {
    font-size: 12px;
    color: var(--text-muted);
    background: #F3F4F6;
    padding: 4px 8px;
    border-radius: 4px;
    display: inline-block;
    margin-bottom: 4px;
}

.btn-row {
    grid-column: span 2;
    display: flex;
    gap: 12px;
    margin-top: 16px;
}

.submit-btn {
    flex: 1;
    padding: 14px;
    background: var(--grad-primary);
    color: white;
    border: none;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    display: flex; align-items: center; justify-content: center; gap: 8px;
}

.submit-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
}

.cancel-btn {
    padding: 14px 24px;
    background: white;
    color: var(--text-main);
    border: 1px solid #E5E7EB;
    border-radius: var(--radius-btn);
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    display: flex; align-items: center; justify-content: center;
    transition: 0.2s;
}

.cancel-btn:hover {
    background: #F9FAFB;
}

/* Back Link */
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
.back-link:hover { color: var(--c-primary); }

@media (max-width: 768px) {
    .header-strip { padding: 0 24px; }
    .main { padding: 100px 24px 24px; }
    
    .form-grid { grid-template-columns: 1fr; }
    .full-width { grid-column: span 1; }
    .btn-row { flex-direction: column; }
}
</style>
</head>
<body>

<!-- HEADER STRIP -->
<div class="header-strip">
    <div class="header-title">
        <i class="ph-bold ph-pencil-simple"></i> Edit Song Details
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="main">

    <div class="form-card">
        <a href="/admin/songs" class="back-link">
            <i class="ph-bold ph-arrow-left"></i> Cancel & Return to Songs
        </a>

        <div class="form-header">
            <h2>✏️ Update Track</h2>
            <p>Modify the details for <strong>${song.songName}</strong> below.</p>
        </div>

        <form action="/admin/songs/update" method="post" enctype="multipart/form-data" modelAttribute="song" class="form-grid">
            
            <input type="hidden" name="libraryId" value="${song.libraryId}">

            <div class="form-group">
                <label>Song Name</label>
                <input type="text" name="songName" value="${song.songName}" required>
            </div>

            <div class="form-group">
                <label>Singer</label>
                <input type="text" name="singer" value="${song.singer}" required>
            </div>

            <div class="form-group">
                <label>Album Name</label>
                <input type="text" name="albumName" value="${song.albumName}">
            </div>

            <div class="form-group">
                <label>Music Director</label>
                <input type="text" name="musicDirector" value="${song.musicDirector}">
            </div>

            <div class="form-group">
                <label>Release Date</label>
                <input type="date" name="releaseDate" value="${song.releaseDate}">
            </div>

            <div class="form-group">
                <label>Song Type</label>
                <select name="songType">
                    <option value="FREE" ${song.songType == 'FREE' ? 'selected' : ''}>FREE</option>
                    <option value="PREMIUM" ${song.songType == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
                </select>
            </div>

            <div class="form-group">
                <label>Song Status</label>
                <select name="songStatus">
                    <option value="AVAILABLE" ${song.songStatus == 'AVAILABLE' ? 'selected' : ''}>AVAILABLE</option>
                    <option value="NOTAVAILABLE" ${song.songStatus == 'NOTAVAILABLE' ? 'selected' : ''}>NOT AVAILABLE</option>
                </select>
            </div>
            
            <div class="form-group full-width">
                <label>Update Audio File (Optional)</label>
                <div style="margin-bottom:6px;">
                    <span class="current-file">
                        <i class="ph-bold ph-file-audio"></i> 
                        Current: ${song.audioPath != null ? song.audioPath : 'No file uploaded'}
                    </span>
                </div>
                <input type="file" name="file" accept=".mp3, .wav" class="form-control"/>
            </div>

            <div class="btn-row">
                <a href="/admin/songs" class="cancel-btn">Cancel</a>
                <button type="submit" class="submit-btn">
                    <i class="ph-bold ph-check-circle"></i> Update Song
                </button>
            </div>
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