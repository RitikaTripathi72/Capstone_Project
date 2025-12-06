<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Playlist Details</title>
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
    --c-secondary: #F43F5E;   
    
    --bg-primary-soft: #EEF2FF;
    --bg-secondary-soft: #FFF1F2;
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 20px;
    --radius-btn: 10px;
    --shadow-card: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    background-color: var(--bg-body);
    background-image: radial-gradient(#E5E7EB 1px, transparent 1px);
    background-size: 24px 24px;
    color: var(--text-main);
    min-height: 100vh;
    padding-bottom: 140px; 
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
    max-width: 1100px;
    margin: 40px auto;
    padding: 20px;
}

.header-card {
    background: var(--bg-card); 
    padding: 32px;
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: 1px solid #FFFFFF;
    display: flex;
    justify-content: space-between;
    align-items: flex-end; 
    margin-bottom: 30px;
}

.header-info h1 {
    font-size: 32px;
    font-weight: 800;
    color: var(--text-main); 
    margin-bottom: 4px;
    letter-spacing: -1px;
}

.header-info p {
    color: var(--text-muted); 
    font-size: 14px;
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 12px;
}

.edit-btn {
    background: transparent;
    border: none;
    color: var(--text-muted);
    font-size: 20px;
    cursor: pointer;
    transition: 0.2s;
    margin-left: 8px;
    width: 32px; height: 32px;
    display: flex; align-items: center; justify-content: center;
    border-radius: 8px;
}
.edit-btn:hover { 
    color: var(--c-primary); 
    background: var(--bg-primary-soft);
}

.stat-badge {
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    padding: 8px 16px;
    border-radius: 50px;
    font-weight: 700;
    font-size: 14px;
    display: flex; align-items: center; gap: 6px;
}

.table-card {
    background: var(--bg-card);
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: 1px solid #FFFFFF;
    overflow: hidden;
}

table { width: 100%; border-collapse: collapse; text-align: left; }

th {
    padding: 16px 24px;
    background: #F9FAFB;
    color: var(--text-muted);
    font-size: 12px;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 0.5px;
    border-bottom: 1px solid #E5E7EB;
}

td {
    padding: 16px 24px;
    border-bottom: 1px solid #F3F4F6;
    font-size: 14px;
    color: var(--text-main);
    vertical-align: middle;
}

tr:last-child td { border-bottom: none; }

.song-row { transition: 0.2s; }
.song-row:hover { background-color: #F9FAFB; }

th:last-child, td:last-child { text-align: right; }

.play-icon {
    color: var(--c-primary);
    font-size: 20px;
    cursor: pointer;
    transition: 0.2s;
    display: flex; align-items: center; justify-content: center;
    width: 32px; height: 32px;
    border-radius: 50%;
    background: var(--bg-primary-soft);
}
.song-row:hover .play-icon {
    background: var(--c-primary); color: white;
    transform: scale(1.1);
}

.song-title { font-weight: 600; color: var(--text-main); }
.song-meta { color: var(--text-muted); font-size: 14px; }

.btn-remove {
    background: var(--bg-secondary-soft);
    color: var(--c-secondary);
    border: none;
    padding: 6px 12px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
    display: inline-flex; align-items: center; gap: 4px;
}
.btn-remove:hover {
    background: #FFE4E6;
}

.player-bar {
    position: fixed;
    bottom: 20px; left: 50%; transform: translateX(-50%);
    width: 95%; max-width: 1100px; height: 80px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(16px);
    border: 1px solid #FFFFFF;
    border-radius: 20px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    display: flex; align-items: center; justify-content: space-between;
    padding: 0 30px;
    z-index: 1000;
}

.player-info { width: 250px; }
.p-title { font-weight: 700; font-size: 15px; color: var(--text-main); margin-bottom: 2px; }
.p-artist { font-size: 13px; color: var(--text-muted); }

.player-controls {
    display: flex; align-items: center; gap: 24px;
}

.ctrl-btn {
    background: none; border: none; cursor: pointer;
    color: var(--text-muted); font-size: 24px;
    transition: 0.2s; display: flex; align-items: center;
}
.ctrl-btn:hover { color: var(--c-primary); transform: scale(1.1); }

.play-btn-large {
    width: 50px; height: 50px;
    border-radius: 50%;
    background: var(--grad-primary);
    color: white;
    border: none;
    display: flex; align-items: center; justify-content: center;
    font-size: 22px;
    cursor: pointer;
    transition: 0.2s;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}
.play-btn-large:hover { transform: scale(1.05); }

.active-ctrl { color: var(--c-primary) !important; }

.empty-state { text-align: center; padding: 60px; color: var(--text-muted); font-style: italic; }

@media(max-width: 768px){
    .navbar { padding: 0 20px; }
    .header-card { flex-direction: column; align-items: flex-start; gap: 20px; }
    .player-bar { width: 100%; bottom: 0; border-radius: 0; height: 110px; flex-direction: column; justify-content: center; gap: 10px; padding: 10px 20px; }
    .player-info { width: 100%; text-align: center; }
}
</style>
</head>
<body>

<div class="navbar">
    <div class="brand">
        <i class="ph-fill ph-playlist"></i>
        <span>Playlist Details</span>
    </div>
    <a href="/user/playlists" class="nav-btn">
        <i class="ph-bold ph-arrow-left"></i> Back to Collection
    </a>
</div>

<div class="container">
    
    <div class="header-card">
        <div class="header-info">
            <div style="display:flex; align-items:center; gap: 8px;">
                <h1 id="plName">Loading...</h1>
                <button onclick="renamePlaylist()" class="edit-btn" title="Rename Playlist">
                    <i class="ph-bold ph-pencil-simple"></i>
                </button>
            </div>
            <p>Curated Collection</p>
        </div>
        <div class="header-actions">
            <div class="stat-badge">
                <i class="ph-bold ph-music-notes"></i>
                <span id="plCount">0</span> Songs
            </div>
        </div>
    </div>

    <!-- Song Table -->
    <div class="table-card">
        <table>
            <thead>
                <tr>
                    <th style="width: 70px; text-align:center;">Play</th>
                    <th>Track Name</th>
                    <th>Artist</th>
                    <th>Album</th>
                    <th>Director</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="songList">
                <tr><td colspan="6" class="empty-state">
                    <i class="ph-bold ph-spinner" style="animation:spin 1s linear infinite; font-size:24px;"></i><br><br>
                    Loading tracks...
                </td></tr>
            </tbody>
        </table>
    </div>

</div>

<audio id="mainAudio" onended="nextSong()"></audio>

<div class="player-bar">
    <div class="player-info">
        <div class="p-title" id="pTitle">Select a track</div>
        <div class="p-artist" id="pArtist">to start listening</div>
    </div>

    <div class="player-controls">
        <button class="ctrl-btn" id="btnShuffle" onclick="toggleShuffle()" title="Shuffle">
            <i class="ph-bold ph-shuffle"></i>
        </button>
        
        <button class="ctrl-btn" onclick="prevSong()" title="Previous">
            <i class="ph-bold ph-skip-back"></i>
        </button>
        
        <button class="play-btn-large" id="btnPlay" onclick="togglePlay()" title="Play/Pause">
            <i id="iconPlay" class="ph-fill ph-play"></i>
        </button>
        
        <button class="ctrl-btn" onclick="nextSong()" title="Next">
            <i class="ph-bold ph-skip-forward"></i>
        </button>
        
        <button class="ctrl-btn" id="btnRepeat" onclick="toggleRepeat()" title="Repeat">
            <i class="ph-bold ph-repeat"></i>
        </button>
    </div>

    <div style="width: 250px; text-align:right; font-size:12px; color:#9CA3AF; display:flex; align-items:center; justify-content:flex-end; gap:6px;">
        <i class="ph-fill ph-speaker-high"></i> Hi-Res Audio
    </div>
</div>

<script>
    // --- 1. DYNAMIC AUTH LOGIC (UNCHANGED) ---
    var user = JSON.parse(localStorage.getItem('user'));
    
    if(!user || !user.userId) {
        window.location.href = "/login";
    }

    var USER_ID = user.userId;
    var JWT_TOKEN = user.jwt; 

    var urlParams = new URLSearchParams(window.location.search);
    var PLAYLIST_ID = urlParams.get('id');

    var PLAYLIST_API = "http://localhost:8081/api/playlists"; 
    var SONGS_API = "http://localhost:8082/api/songs/all";      

    var playlistSongsData = [];
    var currentIndex = -1;
    var audio = document.getElementById("mainAudio");

    async function loadDetails() {
        if(!PLAYLIST_ID) return;

        try {
            // Get Playlist
            var plRes = await fetch(PLAYLIST_API + "/user/" + USER_ID, {
                method: 'GET',
                headers: { 
                    'Authorization': 'Bearer ' + JWT_TOKEN,
                    'Content-Type': 'application/json'
                }
            });
            
            if(!plRes.ok) throw new Error("Failed to load Playlist");

            var playlists = await plRes.json();
            var currentPl = playlists.find(function(p) { return p.playlistId == PLAYLIST_ID; });

            if(!currentPl) {
                document.getElementById("plName").innerText = "Not Found";
                return;
            }

            document.getElementById("plName").innerText = currentPl.playlistName;
            var mySongIds = currentPl.songIds || [];
            document.getElementById("plCount").innerText = mySongIds.length;
            
            // Get Songs
            var songsRes = await fetch(SONGS_API);
            var allSongs = await songsRes.json();

            // Render Table
            var tbody = document.getElementById("songList");
            tbody.innerHTML = "";
            playlistSongsData = [];

            if(mySongIds.length === 0) {
                tbody.innerHTML = '<tr><td colspan="6" class="empty-state">This playlist is empty.<br>Go to the Library to add music!</td></tr>';
                return;
            }

            mySongIds.forEach(function(id) {
                var song = allSongs.find(function(s) { return String(s.libraryId) === String(id) || String(s.songId) === String(id); });
                
                if(song) {
                    playlistSongsData.push(song);
                    var idx = playlistSongsData.length - 1;

                    tbody.innerHTML += 
                        '<tr class="song-row">' +
                            '<td style="text-align:center;">' +
                                '<div class="play-icon" onclick="playSongAtIndex(' + idx + ')">' +
                                    '<i class="ph-fill ph-play"></i>' +
                                '</div>' +
                            '</td>' +
                            '<td class="song-title">' + song.songName + '</td>' +
                            '<td class="song-meta">' + song.singer + '</td>' +
                            '<td class="song-meta">' + (song.albumName || '-') + '</td>' +
                            '<td class="song-meta">' + (song.musicDirector || '-') + '</td>' +
                            '<td style="text-align:right;">' +
                                '<button onclick="removeSong(\'' + id + '\')" class="btn-remove">' +
                                    '<i class="ph-bold ph-trash"></i> Remove' +
                                '</button>' +
                            '</td>' +
                        '</tr>';
                }
            });

        } catch(e) { console.error(e); }
    }

    // --- PLAYER LOGIC (UNCHANGED) ---
    var isPlaying = false;

    function playSongAtIndex(index) {
        if (index < 0 || index >= playlistSongsData.length) return;
        currentIndex = index;
        var song = playlistSongsData[currentIndex];

        document.getElementById("pTitle").innerText = song.songName;
        document.getElementById("pArtist").innerText = song.singer;

        if (song.audioPath) {
            audio.src = song.audioPath;
            audio.play().catch(e => console.error(e));
            isPlaying = true;
        } else {
            console.log("No audio file found.");
            isPlaying = true;
        }
        updatePlayBtnUI();
    }

    function togglePlay() {
        if(currentIndex === -1 && playlistSongsData.length > 0) {
            playSongAtIndex(0);
            return;
        }
        if (isPlaying) { audio.pause(); isPlaying = false; }
        else { audio.play(); isPlaying = true; }
        updatePlayBtnUI();
    }

    function nextSong() {
        if(currentIndex < playlistSongsData.length - 1) playSongAtIndex(currentIndex + 1);
        else playSongAtIndex(0);
    }

    function prevSong() {
        if(currentIndex > 0) playSongAtIndex(currentIndex - 1);
        else playSongAtIndex(playlistSongsData.length - 1);
    }

    function updatePlayBtnUI() {
        var icon = document.getElementById("iconPlay");
        if(isPlaying) {
            icon.classList.remove("ph-play");
            icon.classList.add("ph-pause");
        } else {
            icon.classList.remove("ph-pause");
            icon.classList.add("ph-play");
        }
    }

    function toggleShuffle() { document.getElementById("btnShuffle").classList.toggle("active-ctrl"); }
    function toggleRepeat() { document.getElementById("btnRepeat").classList.toggle("active-ctrl"); }

    // --- ACTIONS ---
    async function renamePlaylist() {
        var currentName = document.getElementById("plName").innerText;
        var newName = prompt("Rename Playlist:", currentName);
        if (!newName || newName.trim() === "") return;
        try {
            var url = PLAYLIST_API + "/" + PLAYLIST_ID + "?name=" + encodeURIComponent(newName);
            await fetch(url, { method: 'PUT', headers: { 'Authorization': 'Bearer ' + JWT_TOKEN } });
            document.getElementById("plName").innerText = newName;
        } catch (e) { console.error(e); }
    }

    async function removeSong(songId) {
        if(!confirm("Remove song from playlist?")) return;
        try {
            await fetch(PLAYLIST_API + "/" + PLAYLIST_ID + "/remove/" + songId, { 
                method: 'DELETE',
                headers: { 'Authorization': 'Bearer ' + JWT_TOKEN }
            });
            loadDetails();
        } catch(e) { console.error(e); }
    }

    loadDetails();
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html>
