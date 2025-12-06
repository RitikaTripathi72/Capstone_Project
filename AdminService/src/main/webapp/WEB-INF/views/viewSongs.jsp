<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View All Songs - Admin Studio</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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
    --shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
    
    --radius-l: 16px;            
    --radius-btn: 8px;
    --radius-pill: 50px;
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
    position: fixed; left: 0; top: 0;
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
    padding: 100px 48px 48px; 
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.stat-card {
    background: var(--bg-card);
    padding: 24px;
    border-radius: var(--radius-l);
    box-shadow: var(--shadow-card);
    display: flex;
    align-items: center;
    gap: 16px;
    border: 1px solid #E5E7EB;
}

.stat-icon {
    width: 48px; height: 48px;
    border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
    font-size: 24px;
}

.stat-info .number { font-size: 24px; font-weight: 800; color: var(--text-main); line-height: 1; }
.stat-info .label { font-size: 13px; color: var(--text-muted); font-weight: 500; margin-top: 4px; }

.controls-bar {
    background: var(--bg-card);
    padding: 16px 24px;
    border-radius: var(--radius-l);
    box-shadow: var(--shadow-card);
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 30px;
    border: 1px solid #E5E7EB;
}

.filter-group { display: flex; gap: 8px; flex-wrap: wrap; }

.filter-btn {
    padding: 8px 16px;
    border-radius: var(--radius-pill);
    border: 1px solid #E5E7EB;
    background: transparent;
    color: var(--text-muted);
    font-size: 13px; font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
}

.filter-btn:hover { background: #F9FAFB; color: var(--text-main); }

.filter-btn.active {
    background: var(--text-main);
    color: white;
    border-color: var(--text-main);
}

.search-wrapper {
    position: relative;
    flex: 1;
    min-width: 250px;
    max-width: 400px;
}

.search-wrapper i {
    position: absolute;
    left: 14px; top: 50%;
    transform: translateY(-50%);
    color: var(--text-muted);
    font-size: 18px;
}

.search-input {
    width: 100%;
    padding: 10px 10px 10px 42px;
    border-radius: var(--radius-btn);
    border: 1px solid #E5E7EB;
    background: #F9FAFB;
    font-size: 14px;
    color: var(--text-main);
    transition: 0.2s;
}

.search-input:focus {
    outline: none;
    background: white;
    border-color: var(--c-primary);
    box-shadow: 0 0 0 3px var(--bg-primary-soft);
}

.songs-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
}

.song-card {
    background: var(--bg-card);
    border-radius: var(--radius-l);
    padding: 24px;
    box-shadow: var(--shadow-card);
    border: 1px solid #E5E7EB;
    transition: all 0.2s;
    position: relative;
    display: flex;
    flex-direction: column;
}

.song-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-hover);
}

.card-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    margin-bottom: 16px;
}

.song-icon {
    width: 40px; height: 40px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
    font-size: 20px;
}

.song-title { font-size: 18px; font-weight: 700; color: var(--text-main); margin-bottom: 4px; line-height: 1.3; }
.song-artist { font-size: 14px; color: var(--text-muted); font-weight: 500; }

.detail-row {
    display: flex; justify-content: space-between;
    font-size: 13px;
    margin-bottom: 8px;
    border-bottom: 1px solid #F3F4F6;
    padding-bottom: 8px;
}

.detail-row:last-of-type { border-bottom: none; }
.detail-label { color: var(--text-muted); }
.detail-value { font-weight: 600; color: var(--text-main); text-align: right; }

/* Badges */
.badge-container { display: flex; gap: 8px; margin: 16px 0; }

.badge {
    padding: 4px 10px;
    border-radius: 6px;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.badge-free { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }
.badge-premium { background: var(--bg-secondary-soft); color: var(--c-secondary); }
.badge-available { background: var(--bg-primary-soft); color: var(--c-primary); }
.badge-not-available { background: #F3F4F6; color: var(--text-muted); }

.card-actions {
    margin-top: auto; 
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
}

.btn-action {
    display: flex; align-items: center; justify-content: center; gap: 6px;
    padding: 10px;
    border-radius: var(--radius-btn);
    font-size: 13px; font-weight: 600;
    text-decoration: none;
    transition: 0.2s;
}

.btn-edit {
    background: #F3F4F6; color: var(--text-main);
}
.btn-edit:hover { background: #E5E7EB; }

.btn-delete {
    background: #FFF1F2; color: #E11D48;
}
.btn-delete:hover { background: #FFE4E6; }

.no-songs {
    grid-column: 1 / -1;
    text-align: center;
    padding: 60px;
    color: var(--text-muted);
    font-size: 16px;
    background: white;
    border-radius: var(--radius-l);
    border: 1px dashed #E5E7EB;
}
.back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: #6B7280;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 20px;
    transition: color 0.2s;
}

@media (max-width: 768px) {
    .left-panel { width: 80px; padding: 24px 16px; }
    .panel-title, .logout-btn span, .panel-nav a span { display: none; }
    .panel-nav a { justify-content: center; }
    .header-strip { left: 80px; width: calc(100% - 80px); padding: 0 24px; }
    .main { margin-left: 80px; padding: 100px 24px 24px; }
    .controls-bar { flex-direction: column; align-items: stretch; }
    .search-wrapper { max-width: 100%; }
}
</style>
</head>
<body>


<div class="header-strip">
    <div class="header-title">
        <i class="ph-bold ph-playlist"></i> Music Library
    </div>
   
    <a href="/admin/add-song" style="text-decoration:none;">
        <div style="background:var(--c-primary); color:white; width:36px; height:36px; border-radius:8px; display:flex; align-items:center; justify-content:center;">
            <i class="ph-bold ph-plus"></i>
        </div>
    </a>
</div>

<!-- LEFT SIDE PANEL -->
<div class="left-panel">
    <div class="panel-title">Main Menu</div>

    <div class="panel-nav">
        <a href="/admin/add-song">
            <i class="ph ph-music-notes-plus"></i>
            <span>Add Song</span>
        </a>
        <!-- Active class for current page -->
        <a href="/admin/songs" class="active">
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

<!-- MAIN CONTENT -->
<div class="main">

<a href="/admin/dashboard" class="back-link">← Back to Dashboard</a>
    <!-- STATS ROW -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon" style="background:var(--bg-primary-soft); color:var(--c-primary);">
                <i class="ph-bold ph-music-notes"></i>
            </div>
            <div class="stat-info">
                <div class="number">${fn:length(songs)}</div>
                <div class="label">Total Tracks</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background:var(--bg-tertiary-soft); color:var(--c-tertiary);">
                <i class="ph-bold ph-tag"></i>
            </div>
            <div class="stat-info">
                <div class="number" id="freeCount">0</div>
                <div class="label">Free Tracks</div>
            </div>
        </div>
    </div>

    <!-- CONTROLS BAR -->
    <div class="controls-bar">
        <div class="filter-group">
            <button class="filter-btn active" onclick="filterSongs('all', this)">All</button>
            <button class="filter-btn" onclick="filterSongs('AVAILABLE', this)">Available</button>
            <button class="filter-btn" onclick="filterSongs('FREE', this)">Free</button>
            <button class="filter-btn" onclick="filterSongs('PREMIUM', this)">Premium</button>
        </div>

        <div class="search-wrapper">
            <i class="ph-bold ph-magnifying-glass"></i>
            <input id="searchInput" class="search-input" type="text" placeholder="Search song, artist or album..." onkeyup="searchSongs()" />
        </div>
    </div>

    <!-- SONGS GRID -->
    <div class="songs-grid" id="songsGrid">
        
        <c:forEach var="song" items="${songs}">
            <div class="song-card" 
                 data-type="${song.songType}" 
                 data-status="${song.songStatus}"
                 data-search="${song.songName.toLowerCase()} ${song.singer.toLowerCase()} ${song.albumName.toLowerCase()}">
                
                <div class="card-header">
                    <div>
                        <div class="song-title">${song.songName}</div>
                        <div class="song-artist">${song.singer}</div>
                    </div>
                    <div class="song-icon">
                        <i class="ph-fill ph-music-note"></i>
                    </div>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Album</span>
                    <span class="detail-value">${song.albumName}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Director</span>
                    <span class="detail-value">${song.musicDirector}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Released</span>
                    <span class="detail-value">${song.releaseDate}</span>
                </div>

                <div class="badge-container">
                    <span class="badge ${song.songType == 'FREE' ? 'badge-free' : 'badge-premium'}">
                        ${song.songType}
                    </span>
                    <span class="badge ${song.songStatus == 'AVAILABLE' ? 'badge-available' : 'badge-not-available'}">
                        ${song.songStatus}
                    </span>
                </div>

                <div class="card-actions">
                    <a href="/admin/songs/edit?id=${song.libraryId}" class="btn-action btn-edit">
                        <i class="ph-bold ph-pencil-simple"></i> Edit
                    </a>

                    <a href="/admin/songs/delete?id=${song.libraryId}" class="btn-action btn-delete" onclick="return confirm('Are you sure you want to delete this song?')">
                        <i class="ph-bold ph-trash"></i> Delete
                    </a>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty songs}">
            <div class="no-songs">
                <i class="ph ph-vinyl-record" style="font-size:32px; margin-bottom:10px; display:block;"></i>
                No songs found in the database.
            </div>
        </c:if>

    </div>
</div>

<script>
    function logout(){
        localStorage.removeItem('admin');
        document.cookie = "jwtToken=; path=/; max-age=0";
        window.location.href='/admin/login';
    }

    document.addEventListener("DOMContentLoaded", function() {
        const cards = document.querySelectorAll('.song-card');
        let freeCount = 0;
        
        cards.forEach(card => {
            if(card.getAttribute('data-type') === 'FREE') freeCount++;
        });

        document.getElementById('freeCount').textContent = freeCount;
    });

    function filterSongs(filterType, btn) {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        if(btn) btn.classList.add('active');

        const cards = document.querySelectorAll('.song-card');

        cards.forEach(card => {
            const type = card.getAttribute('data-type');
            const status = card.getAttribute('data-status');

            if (filterType === 'all') {
                card.style.display = 'flex'; // Changed to flex for card layout
            } else if (filterType === 'FREE' || filterType === 'PREMIUM') {
                card.style.display = (type === filterType) ? 'flex' : 'none';
            } else if (filterType === 'AVAILABLE') {
                card.style.display = (status === 'AVAILABLE') ? 'flex' : 'none';
            }
        });
    }

    function searchSongs() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const cards = document.querySelectorAll('.song-card');

        cards.forEach(card => {
            const searchData = card.getAttribute('data-search');
            if (searchData.includes(input)) {
                card.style.display = 'flex';
            } else {
                card.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>