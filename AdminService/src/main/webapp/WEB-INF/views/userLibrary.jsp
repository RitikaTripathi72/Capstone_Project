<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Music Library</title>
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

.header-section {
    text-align: center;
    margin-bottom: 50px;
}

h1 {
    font-size: 42px;
    font-weight: 900;
    margin-bottom: 20px;
    letter-spacing: -1px;
    background: var(--grad-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: var(--c-primary); 
}

.search-wrapper {
    position: relative;
    max-width: 600px;
    margin: 0 auto;
}

.search-wrapper i {
    position: absolute;
    left: 20px; top: 50%;
    transform: translateY(-50%);
    color: var(--text-muted);
    font-size: 22px;
    pointer-events: none;
    transition: 0.2s;
}

.search-input {
    width: 100%;
    padding: 18px 18px 18px 54px;
    border-radius: 50px; 
    border: 1px solid #E5E7EB;
    background: white;
    font-size: 16px;
    color: var(--text-main);
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    transition: 0.2s;
}

.search-input:focus {
    outline: none;
    border-color: var(--c-primary);
    box-shadow: 0 0 0 4px var(--bg-primary-soft);
}
.search-input:focus + i { color: var(--c-primary); }

.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 28px;
}

.card {
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
    border-top: 4px solid var(--c-primary); 
}

.card:nth-child(3n+1) { border-top-color: var(--c-primary); }
.card:nth-child(3n+2) { border-top-color: var(--c-secondary); }
.card:nth-child(3n+3) { border-top-color: var(--c-tertiary); }

.card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-hover);
}

.card-top {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 20px;
}

.icon-box {
    width: 52px; height: 52px;
    border-radius: 14px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    display: flex; align-items: center; justify-content: center;
    font-size: 26px;
}

.card:nth-child(3n+2) .icon-box { background: var(--bg-secondary-soft); color: var(--c-secondary); }
.card:nth-child(3n+3) .icon-box { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }

.title {
    font-size: 18px;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 4px;
    line-height: 1.3;
}

.artist {
    font-size: 14px;
    color: var(--text-muted);
    font-weight: 500;
}

.album-tag {
    display: inline-block;
    padding: 6px 12px;
    background: #F8FAFC;
    color: #64748B;
    border-radius: 8px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    margin-bottom: 24px;
    letter-spacing: 0.5px;
    border: 1px solid #F1F5F9;
}

.btn-add {
    margin-top: auto;
    width: 100%;
    padding: 12px;
    background: white;
    border: 1px solid #FECDD3; 
    color: var(--c-secondary); 
    border-radius: var(--radius-btn);
    font-weight: 700;
    font-size: 14px;
    cursor: pointer;
    transition: 0.2s;
    display: flex; align-items: center; justify-content: center; gap: 8px;
}

.btn-add:hover {
    background: var(--c-secondary);
    border-color: var(--c-secondary);
    color: white;
    box-shadow: 0 4px 12px rgba(244, 63, 94, 0.25);
}

.modal {
    display: none;
    position: fixed; top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(4px);
    justify-content: center;
    align-items: center;
    z-index: 1000;
    animation: fadeIn 0.2s ease;
}

.modal-content {
    background: white;
    padding: 36px;
    border-radius: 24px;
    width: 90%;
    max-width: 420px;
    text-align: center;
    box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    animation: scaleIn 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    border: 1px solid rgba(0,0,0,0.05);
}

.modal-content h3 { font-size: 22px; font-weight: 800; margin-bottom: 8px; color: var(--text-main); }
.modal-content p { color: var(--text-muted); font-size: 15px; margin-bottom: 24px; }

.pl-select {
    width: 100%;
    padding: 14px;
    border-radius: 12px;
    border: 1px solid #E5E7EB;
    font-size: 15px;
    margin-bottom: 28px;
    background-color: #F9FAFB;
    outline: none;
    color: var(--text-main);
}
.pl-select:focus { border-color: var(--c-secondary); background: white; box-shadow: 0 0 0 3px var(--bg-secondary-soft); }

.modal-btns { display: flex; gap: 12px; }

.btn-cancel {
    flex: 1; padding: 14px;
    background: #F3F4F6; color: var(--text-main);
    border: none; border-radius: 12px;
    font-weight: 600; cursor: pointer; transition: 0.2s;
}
.btn-cancel:hover { background: #E5E7EB; }

.btn-confirm {
    flex: 1; padding: 14px;
    background: var(--c-secondary); color: white;
    border: none; border-radius: 12px;
    font-weight: 600; cursor: pointer; transition: 0.2s;
}
.btn-confirm:hover { background: #E11D48; box-shadow: 0 4px 12px rgba(225, 29, 72, 0.3); }

.loading { grid-column: 1/-1; text-align: center; padding: 60px; color: var(--text-muted); font-weight: 500; font-size: 16px; }

@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
@keyframes scaleIn { from { transform: scale(0.95); opacity: 0; } to { transform: scale(1); opacity: 1; } }

@media(max-width: 768px){
    .navbar { padding: 0 20px; }
    .nav-links span { display: none; } 
    h1 { font-size: 32px; }
}
</style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="brand">
        <i class="ph-fill ph-music-notes"></i>
        <span>Music Library</span>
    </div>
    <div class="nav-links">
        <a href="/user/playlists" class="nav-btn">
            <i class="ph-bold ph-playlist"></i>
            <span>My Playlists</span>
        </a>
        <a href="/user/dashboard" class="nav-btn">
            <i class="ph-bold ph-house"></i>
            <span>Dashboard</span>
        </a>
    </div>
</div>

<div class="container">
    <div class="header-section">
        <h1>Explore Songs</h1>
        <div class="search-wrapper">
            <i class="ph-bold ph-magnifying-glass"></i>
            <input type="text" id="searchInput" class="search-input" placeholder="Search by song, artist, or album..." onkeyup="filterSongs()">
        </div>
    </div>

    <div id="songGrid" class="grid">
        <div class="loading">
            <i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite; font-size:32px; color:var(--c-primary);"></i><br><br>
            Fetching your music library...
        </div>
    </div>
</div>

<!-- MODAL -->
<div id="playlistModal" class="modal">
    <div class="modal-content">
        <h3>Add to Playlist</h3>
        <p>Choose a playlist to save this track:</p>
        
        <select id="playlistSelect" class="pl-select">
            <option>Loading playlists...</option>
        </select>
        
        <div class="modal-btns">
            <button class="btn-cancel" onclick="closeModal()">Cancel</button>
            <button class="btn-confirm" onclick="confirmAddToPlaylist()">Confirm Add</button>
        </div>
    </div>
</div>

<script>
    // --- 1. DYNAMIC USER ID & TOKEN LOGIC (PRESERVED) ---
    var user = JSON.parse(localStorage.getItem('user'));
    
    // Safety check
    if(!user || !user.userId) {
        window.location.href = "/login";
    }

    var USER_ID = user.userId;
    var JWT_TOKEN = user.jwt; 

    var SONGS_API = "http://localhost:8082/api/songs/all";
    var PLAYLIST_API = "http://localhost:8081/api/playlists";
    var allSongs = [];
    var selectedSongId = null;

    async function loadLibrary() {
        try {
            var res = await fetch(SONGS_API);
            allSongs = await res.json();
            renderSongs(allSongs);
        } catch(e) { 
            console.error(e);
            document.getElementById("songGrid").innerHTML = "<div class='loading'>Error loading songs. Is the backend running?</div>";
        }
    }

    function renderSongs(songs) {
        var grid = document.getElementById("songGrid");
        grid.innerHTML = "";
        
        if(songs.length === 0) {
            grid.innerHTML = "<div class='loading'>No songs found matching your criteria.</div>";
            return;
        }

        // Updated HTML Generation
        songs.forEach(function(s) {
            if(s.songStatus && s.songStatus !== 'AVAILABLE') return; 
            var id = s.songId || s.libraryId; 
            var album = s.albumName ? s.albumName : "Single";

            grid.innerHTML += 
                '<div class="card">' +
                    '<div class="card-top">' +
                        '<div>' +
                            '<div class="title">' + s.songName + '</div>' +
                            '<div class="artist">' + s.singer + '</div>' +
                        '</div>' +
                        '<div class="icon-box"><i class="ph-fill ph-music-note"></i></div>' +
                    '</div>' +
                    
                    '<div class="album-tag">' + album + '</div>' +
                    
                    '<button class="btn-add" onclick="openAddModal(\'' + id + '\')">' +
                        '<i class="ph-bold ph-heart"></i> Add to Playlist' +
                    '</button>' +
                '</div>';
        });
    }

    function filterSongs() {
        var term = document.getElementById("searchInput").value.toLowerCase();
        var filtered = allSongs.filter(function(s) {
            return (s.songName && s.songName.toLowerCase().includes(term)) || 
                   (s.singer && s.singer.toLowerCase().includes(term));
        });
        renderSongs(filtered);
    }

    async function openAddModal(songId) {
        selectedSongId = songId;
        document.getElementById("playlistModal").style.display = "flex";
        var select = document.getElementById("playlistSelect");
        select.innerHTML = "<option>Loading...</option>";
        
        try {
            // Fetch User Playlists (NEEDS TOKEN)
            var res = await fetch(PLAYLIST_API + "/user/" + USER_ID, {
                method: 'GET',
                headers: { 
                    'Authorization': 'Bearer ' + JWT_TOKEN,
                    'Content-Type': 'application/json'
                }
            });

            var playlists = await res.json();
            select.innerHTML = "";
            if(playlists.length === 0) {
                select.innerHTML = "<option value=''>No playlists found. Create one first!</option>";
                return;
            }
            playlists.forEach(function(p) {
                select.innerHTML += '<option value="' + p.playlistId + '">' + p.playlistName + '</option>';
            });
        } catch(e) { console.error(e); }
    }

    function closeModal() {
        document.getElementById("playlistModal").style.display = "none";
    }

    async function confirmAddToPlaylist() {
        var playlistId = document.getElementById("playlistSelect").value;
        if(!playlistId) return;
        var url = PLAYLIST_API + "/" + playlistId + "/add/" + selectedSongId;
        
        try {
            // Add Song (NEEDS TOKEN)
            await fetch(url, { 
                method: 'POST',
                headers: { 
                    'Authorization': 'Bearer ' + JWT_TOKEN
                }
            });
            closeModal();
            alert("Song added successfully!");
        } catch(e) {
            console.error(e);
            alert("Error adding song.");
        }
    }

    loadLibrary();
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>