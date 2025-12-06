<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Playlists - Music Library</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&display=swap" rel="stylesheet">
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
    
    --radius-card: 20px;
    --radius-btn: 12px;
    --shadow-card: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
    --shadow-hover: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
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
.brand i { color: var(--c-primary); font-size: 28px; }

.nav-links { display: flex; gap: 12px; }

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
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px;
}

.header-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 30px;
}

h1 {
    font-size: 36px;
    font-weight: 900;
    margin: 0;
    letter-spacing: -1px;
    
    background: var(--grad-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: var(--c-primary);
}

.subtitle {
    font-size: 15px;
    color: var(--text-muted);
    margin-top: 4px;
    font-weight: 500;
}

.stats-badge {
    background: white;
    padding: 10px 20px;
    border-radius: 50px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    font-size: 14px;
    font-weight: 600;
    color: var(--text-muted);
    display: flex;
    align-items: center;
    gap: 8px;
    border: 1px solid #E5E7EB;
}
.stats-badge strong { color: var(--c-primary); font-size: 16px; }

.create-wrapper {
    background: white;
    padding: 8px;
    border-radius: 60px; 
    box-shadow: var(--shadow-card);
    max-width: 100%;
    margin-bottom: 40px;
    display: flex;
    gap: 12px;
    border: 1px solid #E5E7EB;
    align-items: center;
    transition: 0.3s;
}

.create-wrapper:focus-within {
    border-color: var(--c-primary);
    box-shadow: 0 0 0 4px var(--bg-primary-soft);
}

.input-group {
    flex: 1;
    position: relative;
    margin-left: 16px;
}

.input-group input {
    width: 100%;
    padding: 12px;
    border: none;
    background: transparent;
    font-size: 16px;
    outline: none;
    color: var(--text-main);
}

.btn-create {
    padding: 12px 28px;
    background: var(--text-main); 
    color: white;
    border: none;
    border-radius: 50px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
    display: flex; align-items: center; gap: 8px;
    white-space: nowrap;
}

.btn-create:hover {
    background: var(--c-primary);
    transform: translateX(-2px);
    box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
}

.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
}

.playlist-card {
    background: var(--bg-card);
    padding: 24px;
    border-radius: var(--radius-card);
    border: 1px solid #FFFFFF;
    box-shadow: var(--shadow-card);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    flex-direction: column;
    position: relative;
    overflow: hidden;
    cursor: pointer;
    border-top: 4px solid var(--c-primary); 
}

.playlist-card:nth-child(3n+1) { border-top-color: var(--c-primary); }
.playlist-card:nth-child(3n+2) { border-top-color: var(--c-secondary); }
.playlist-card:nth-child(3n+3) { border-top-color: var(--c-tertiary); }

.playlist-card:hover {
    transform: translateY(-6px);
    box-shadow: var(--shadow-hover);
}

.card-header-row {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 24px;
}

.pl-icon-box {
    width: 60px; height: 60px;
    border-radius: 14px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    display: flex; align-items: center; justify-content: center;
    font-size: 30px;
    flex-shrink: 0;
    border: 1px solid rgba(0,0,0,0.03);
}

.playlist-card:nth-child(3n+2) .pl-icon-box { background: var(--bg-secondary-soft); color: var(--c-secondary); }
.playlist-card:nth-child(3n+3) .pl-icon-box { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }

.pl-info {
    flex: 1;
    overflow: hidden;
}

.pl-title {
    font-size: 18px;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 4px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.pl-count {
    font-size: 13px;
    color: var(--text-muted);
    font-weight: 500;
}

.actions {
    display: flex;
    gap: 10px;
    margin-top: auto;
}

.btn-action {
    flex: 1;
    padding: 10px;
    border-radius: 10px;
    border: 1px solid transparent;
    font-size: 13px; font-weight: 600;
    cursor: pointer;
    display: flex; align-items: center; justify-content: center; gap: 6px;
    transition: 0.2s;
}

.btn-rename {
    background: #F8FAFC; color: var(--text-main);
    border-color: #E2E8F0;
}
.btn-rename:hover { background: #F1F5F9; border-color: #CBD5E1; }

.btn-delete {
    background: white; color: var(--c-secondary);
    border-color: #FECDD3;
}
.btn-delete:hover { background: #FFF1F2; border-color: var(--c-secondary); }

.loading { grid-column: 1/-1; text-align: center; padding: 60px; color: var(--text-muted); font-weight: 500; font-size: 16px;}

@media(max-width: 768px){
    .navbar { padding: 0 20px; }
    .header-row { flex-direction: column; align-items: flex-start; gap: 10px; }
    .btn-create span { display: none; }
}
</style>
</head>
<body>

<div class="navbar">
    <div class="brand">
        <i class="ph-fill ph-playlist"></i>
        <span>My Collection</span>
    </div>
    <div class="nav-links">
        <a href="/user/dashboard" class="nav-btn">
            <i class="ph-bold ph-house"></i> Dashboard
        </a>
    </div>
</div>

<div class="container">
    
    <!-- HEADER ROW -->
    <div class="header-row">
        <div>
            <h1>Your Playlists</h1>
            <div class="subtitle">Manage your personal music collections</div>
        </div>
        <div class="stats-badge">
            <span id="totalPlaylists">0</span> <strong>Playlists</strong>
        </div>
    </div>

    <!-- CREATE SECTION -->
    <div class="create-wrapper">
        <div class="input-group">
            <input type="text" id="playlistName" placeholder="✨ Create new playlist..." />
        </div>
        <button class="btn-create" onclick="createPlaylist()">
            <i class="ph-bold ph-plus"></i> <span>Create</span>
        </button>
    </div>

    <!-- GRID -->
    <div id="playlistGrid" class="grid">
        <div class="loading">
            <i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite; font-size:32px; color:var(--c-primary);"></i><br><br>
            Loading your collection...
        </div>
    </div>
</div>

<script>
    // 1. AUTH LOGIC
    var user = JSON.parse(localStorage.getItem('user'));
    if(!user || !user.userId) {
        alert("You are not logged in!");
        window.location.href = "/login";
    }
    var USER_ID = user.userId;
    var JWT_TOKEN = user.jwt; 
    var API_URL = "http://localhost:8081/api/playlists"; 

    // --- 2. ICON LOGIC ---
    function parsePlaylistDisplay(fullName, id) {
        const emojiRegex = /^(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])/;
        const match = fullName.match(emojiRegex);

        if (match) {
            return {
                icon: match[0], 
                name: fullName.replace(emojiRegex, '').trim() 
            };
        } else {
            return {
                icon: getSmartIconFallback(fullName, id),
                name: fullName
            };
        }
    }

    function getSmartIconFallback(name, id) {
        const lower = name.toLowerCase();
        if(lower.includes('gym') || lower.includes('work') || lower.includes('fit')) return '💪';
        if(lower.includes('travel') || lower.includes('trip') || lower.includes('drive')) return '🚗';
        if(lower.includes('love') || lower.includes('heart')) return '❤️';
        if(lower.includes('party') || lower.includes('dance')) return '🎉';
        if(lower.includes('sleep') || lower.includes('calm')) return '🌙';
        
        const musicIcons = ['🎵', '🎧', '💿', '🎹', '🎼', '📻', '🎙️', '🥁'];
        return musicIcons[id % musicIcons.length];
    }

    // 3. Load Playlists
    async function loadPlaylists() {
        try {
            var res = await fetch(API_URL + "/user/" + USER_ID, {
                method: 'GET',
                headers: {
                    'Authorization': 'Bearer ' + JWT_TOKEN, 
                    'Content-Type': 'application/json'
                }
            });

            if(!res.ok) { console.error("Failed to load"); return; }

            var playlists = await res.json();
            document.getElementById("totalPlaylists").textContent = playlists.length;
            var grid = document.getElementById("playlistGrid");
            grid.innerHTML = "";

            if(playlists.length === 0) {
                grid.style.display = "block";
                grid.innerHTML = `
                    <div style="text-align:center; padding:50px; color:#6B7280;">
                        <i class="ph ph-vinyl-record" style="font-size:48px; opacity:0.3; margin-bottom:10px;"></i>
                        <h3>It's quiet here.</h3>
                        <p>Create your first playlist above to get started!</p>
                    </div>`;
                return;
            }

            grid.style.display = "grid";
            playlists.forEach(function(pl) {
                var count = pl.songIds ? pl.songIds.length : 0;
                var safeName = pl.playlistName.replace(/'/g, "\\'"); 
                
                var displayData = parsePlaylistDisplay(pl.playlistName, pl.playlistId);

                // HTML GENERATION
                grid.innerHTML += 
                    '<div class="playlist-card" onclick="openDetails(' + pl.playlistId + ')">' +
                        
                        '<div class="card-header-row">' +
                            '<div class="pl-icon-box">' + displayData.icon + '</div>' + 
                            '<div class="pl-info">' +
                                '<div class="pl-title">' + displayData.name + '</div>' +
                                '<div class="pl-count">' + count + ' Songs</div>' +
                            '</div>' +
                        '</div>' +
                        
                        '<div class="actions">' +
                            '<button onclick="renamePlaylist(event, ' + pl.playlistId + ', \'' + safeName + '\')" class="btn-action btn-rename">' +
                                '<i class="ph-bold ph-pencil-simple"></i> Rename' +
                            '</button>' +
                            '<button onclick="deletePlaylist(event, ' + pl.playlistId + ')" class="btn-action btn-delete">' +
                                '<i class="ph-bold ph-trash"></i> Delete' +
                            '</button>' +
                        '</div>' +
                    '</div>';
            });
        } catch(err) { console.error(err); }
    }

    function openDetails(id) { window.location.href = "/user/playlist/details?id=" + id; }

    async function createPlaylist() {
        var nameInput = document.getElementById("playlistName");
        var name = nameInput.value.trim();
        if(!name) { alert("Enter a name!"); return; }
        
        try {
            var url = API_URL + "/create?userId=" + USER_ID + "&name=" + encodeURIComponent(name);
            var res = await fetch(url, { 
                method: 'POST',
                headers: { 'Authorization': 'Bearer ' + JWT_TOKEN }
            });
            if(res.ok) { nameInput.value = ""; loadPlaylists(); }
        } catch(e) { console.error(e); }
    }

    async function renamePlaylist(event, id, currentName) {
        event.stopPropagation();
        var newName = prompt("Rename Playlist (Tip: Add an emoji at start like '👽 Space'):", currentName);
        if(!newName || newName.trim() === "" || newName === currentName) return;

        try {
            var url = API_URL + "/" + id + "?name=" + encodeURIComponent(newName);
            var res = await fetch(url, {
                method: 'PUT',
                headers: { 'Authorization': 'Bearer ' + JWT_TOKEN }
            });
            if(res.ok) { loadPlaylists(); } else { alert("Failed to rename."); }
        } catch(e) { console.error(e); }
    }

    async function deletePlaylist(event, id) {
        event.stopPropagation();
        if(!confirm("Are you sure?")) return;
        try { 
            await fetch(API_URL + "/" + id, { 
                method: 'DELETE',
                headers: { 'Authorization': 'Bearer ' + JWT_TOKEN }
            }); 
            loadPlaylists(); 
        } catch(e) { console.error(e); }
    }

    loadPlaylists();
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>