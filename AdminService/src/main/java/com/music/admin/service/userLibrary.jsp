<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Library</title>
<style>
/* APPLE THEME (Consistent) */
:root {
    --bg:#FAFAFA; --surface:#FFFFFF; --text-primary:#1C1C1E; --text-secondary:#3A3A3C;
    --accent:#FF2D55; --border:#E5E5EA; --radius:16px; --shadow:0 4px 14px rgba(0,0,0,0.08);
}
*{margin:0;padding:0;box-sizing:border-box;font-family:-apple-system,Inter,sans-serif;}
body{background:var(--bg);color:var(--text-primary);min-height:100vh;padding-bottom:40px;}

.navbar{height:64px;background:var(--surface);padding:0 26px;display:flex;align-items:center;justify-content:space-between;border-bottom:1px solid var(--border);box-shadow:var(--shadow);}
.navbar h2{font-size:22px;font-weight:700;}
.nav-links a { margin-left:15px; text-decoration:none; color:var(--text-secondary); font-weight:600; font-size:14px; }
.nav-links a:hover { color:var(--accent); }
.btn-nav { background:var(--accent); color:white !important; padding:8px 16px; border-radius:20px; }

.container{max-width:1300px;margin:30px auto;padding:0 20px;}

/* SEARCH BAR */
.search-section { margin-bottom: 25px; }
.search-input { width:100%; padding:16px; border-radius:var(--radius); border:1px solid var(--border); font-size:16px; box-shadow:var(--shadow); }
.search-input:focus { outline:none; border-color:var(--accent); }

/* SONG GRID */
.grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(280px,1fr)); gap:20px; }
.card { background:var(--surface); padding:20px; border-radius:var(--radius); border:1px solid var(--border); box-shadow:var(--shadow); transition:0.2s; }
.card:hover { transform:translateY(-5px); }
.icon { font-size: 40px; margin-bottom: 10px; display:block; }
.title { font-weight:700; font-size:18px; margin-bottom:5px; }
.artist { color:var(--text-secondary); font-size:14px; margin-bottom:15px; }

/* ADD BUTTON */
.btn-add {
    width:100%; padding:10px; background:var(--surface); border:1px solid var(--accent); 
    color:var(--accent); border-radius:10px; font-weight:600; cursor:pointer; transition:0.2s;
}
.btn-add:hover { background:var(--accent); color:white; }

/* MODAL (For selecting Playlist) */
.modal { display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); justify-content:center; align-items:center; }
.modal-content { background:white; padding:30px; border-radius:var(--radius); width:350px; text-align:center; }
.modal h3 { margin-bottom:15px; }
.pl-select { width:100%; padding:10px; margin-bottom:20px; border-radius:8px; border:1px solid #ccc; font-size:16px; }
.modal-btns { display:flex; gap:10px; justify-content:center; }
.btn-cancel { background:#eee; color:#333; padding:10px 20px; border-radius:8px; border:none; cursor:pointer; }
.btn-confirm { background:var(--accent); color:white; padding:10px 20px; border-radius:8px; border:none; cursor:pointer; }
</style>
</head>
<body>

<div class="navbar">
    <h2>🎵 Music Library</h2>
    <div class="nav-links">
        <a href="/user/playlists">My Playlists</a>
        <a href="#" class="btn-nav">Browse</a>
    </div>
</div>

<div class="container">
    <div class="search-section">
        <input type="text" id="searchInput" class="search-input" placeholder="🔍 Search songs by name, artist, or album..." onkeyup="filterSongs()">
    </div>

    <div id="songGrid" class="grid">
        <div style="text-align:center; width:100%;">Loading Library...</div>
    </div>
</div>

<div id="playlistModal" class="modal">
    <div class="modal-content">
        <h3>Add to Playlist</h3>
        <p style="margin-bottom:10px; color:#666;">Select a playlist:</p>
        <select id="playlistSelect" class="pl-select">
            <option>Loading playlists...</option>
        </select>
        <div class="modal-btns">
            <button class="btn-cancel" onclick="closeModal()">Cancel</button>
            <button class="btn-confirm" onclick="confirmAddToPlaylist()">Add Song</button>
        </div>
    </div>
</div>

<script>
    var USER_ID = 1;
    var SONGS_API = "http://localhost:8082/api/songs/all";
    var PLAYLIST_API = "http://localhost:8081/api/playlists";
    
    var allSongs = [];
    var selectedSongId = null;

    // 1. Load All Songs
    async function loadLibrary() {
        try {
            var res = await fetch(SONGS_API);
            allSongs = await res.json();
            renderSongs(allSongs);
        } catch(e) { console.error(e); }
    }

    function renderSongs(songs) {
        var grid = document.getElementById("songGrid");
        grid.innerHTML = "";
        
        songs.forEach(function(s) {
            // Check visibility (Requirement 3)
            if(s.songStatus !== 'AVAILABLE') return; 

            // Use libraryId if available, else songId
            var id = s.libraryId || s.songId;

            grid.innerHTML += 
                '<div class="card">' +
                    '<span class="icon">🎵</span>' +
                    '<div class="title">' + s.songName + '</div>' +
                    '<div class="artist">' + s.singer + ' • ' + s.albumName + '</div>' +
                    '<button class="btn-add" onclick="openAddModal(\'' + id + '\')">❤️ Add to Playlist</button>' +
                '</div>';
        });
    }

    // 2. Search Function (Objective 1)
    function filterSongs() {
        var term = document.getElementById("searchInput").value.toLowerCase();
        var filtered = allSongs.filter(function(s) {
            return s.songName.toLowerCase().includes(term) || 
                   s.singer.toLowerCase().includes(term) ||
                   s.albumName.toLowerCase().includes(term);
        });
        renderSongs(filtered);
    }

    // 3. Open Modal & Load Playlists
    async function openAddModal(songId) {
        selectedSongId = songId;
        document.getElementById("playlistModal").style.display = "flex";
        
        // Fetch User's Playlists to populate dropdown
        var select = document.getElementById("playlistSelect");
        select.innerHTML = "<option>Loading...</option>";
        
        try {
            var res = await fetch(PLAYLIST_API + "/user/" + USER_ID);
            var playlists = await res.json();
            
            select.innerHTML = "";
            if(playlists.length === 0) {
                select.innerHTML = "<option value=''>No playlists found</option>";
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

    // 4. Save to Playlist (Objective 5)
    async function confirmAddToPlaylist() {
        var playlistId = document.getElementById("playlistSelect").value;
        if(!playlistId) { alert("Please select a playlist!"); return; }

        try {
            // API: POST /api/playlists/{playlistId}/add/{songId}
            var url = PLAYLIST_API + "/" + playlistId + "/add/" + selectedSongId;
            var res = await fetch(url, { method: 'POST' });
            
            if(res.ok) {
                alert("Song added successfully!");
                closeModal();
            } else {
                alert("Failed to add song.");
            }
        } catch(e) { console.error(e); }
    }

    loadLibrary();
</script>

</body>
</html>