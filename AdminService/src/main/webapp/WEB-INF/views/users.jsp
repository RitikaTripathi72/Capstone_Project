 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Users - Admin Studio</title>
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
    
    --c-warning: #F59E0B;        
    --bg-warning-soft: #FFFBEB;

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

.users-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
}

.user-card {
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

.user-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-hover);
}

.user-header {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 20px;
}

.avatar-circle {
    width: 48px; height: 48px;
    background: var(--bg-primary-soft);
    color: var(--c-primary);
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-size: 20px;
    font-weight: 700;
}

.user-info h3 {
    font-size: 16px; font-weight: 700; color: var(--text-main);
    margin-bottom: 2px;
}
.user-info p {
    font-size: 13px; color: var(--text-muted);
}

.detail-row {
    display: flex; justify-content: space-between;
    font-size: 13px;
    margin-bottom: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid #F3F4F6;
}
.detail-label { color: var(--text-muted); }
.detail-value { font-weight: 500; color: var(--text-main); }

.status-badge {
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
}
.status-active { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }
.status-inactive { background: var(--bg-secondary-soft); color: var(--c-secondary); }

.card-actions {
    margin-top: auto;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
}

.btn-action {
    padding: 10px;
    border-radius: var(--radius-btn);
    border: none;
    font-size: 13px; font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
    display: flex; align-items: center; justify-content: center; gap: 6px;
}

.btn-block { background: var(--bg-warning-soft); color: var(--c-warning); }
.btn-block:hover { background: #FEF3C7; }

.btn-unblock { background: var(--bg-tertiary-soft); color: var(--c-tertiary); }
.btn-unblock:hover { background: #D1FAE5; }

.btn-delete { background: var(--bg-secondary-soft); color: var(--c-secondary); }
.btn-delete:hover { background: #FFE4E6; }

.state-message {
    grid-column: 1 / -1;
    text-align: center;
    padding: 40px;
    background: white;
    border-radius: var(--radius-l);
    color: var(--text-muted);
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
}
</style>
</head>
<body>


<div class="header-strip">
    <div class="header-title">
        <i class="ph-bold ph-users-three"></i> User Management
    </div>
</div>

<!-- LEFT SIDE PANEL -->
<div class="left-panel">
    <div class="panel-title">Main Menu</div>

    <div class="panel-nav">
        <a href="/admin/add-song">
            <i class="ph ph-music-notes-plus"></i>
            <span>Add Song</span>
        </a>
        <a href="/admin/songs">
            <i class="ph ph-playlist"></i>
            <span>All Songs</span>
        </a>
        <!-- Active class for Users -->
        <a href="/admin/users" class="active">
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
                <i class="ph-bold ph-user-circle"></i>
            </div>
            <div class="stat-info">
                <div class="number" id="totalUsers">0</div>
                <div class="label">Total Registered Users</div>
            </div>
        </div>
    </div>

    <!-- USERS GRID CONTAINER -->
    <div class="users-grid" id="usersList">
        <div class="state-message">
            <i class="ph-bold ph-spinner" style="animation: spin 1s linear infinite; font-size: 24px;"></i>
            <br><br>Loading users...
        </div>
    </div>

</div>

<script>
    // URL Logic preserved from original file
    const BASE_URL = "http://localhost:8081/api/users"; 

    async function loadUsers(){
        try {
            const res = await fetch("http://localhost:8081/api/users/all");
            
            if (!res.ok) {
                throw new Error(`HTTP error! Status: ${res.status}`);
            }

            const users = await res.json();
            document.getElementById("totalUsers").textContent = users.length;

            let html = "";
            
            if(users.length === 0) {
                document.getElementById("usersList").innerHTML = 
                    '<div class="state-message">No users found in the database.</div>';
                return;
            }

            users.forEach(u => {
                // Logic for Toggle Button Style
                let isBlocked = u.status !== 'ACTIVE'; // If not ACTIVE, assume blocked/inactive
                let statusClass = isBlocked ? 'status-inactive' : 'status-active';
                let statusText = u.status || 'ACTIVE';
                
                let toggleBtnClass = isBlocked ? 'btn-unblock' : 'btn-block';
                let toggleBtnText = isBlocked ? 'Unblock' : 'Block';
                let toggleBtnIcon = isBlocked ? 'ph-lock-open' : 'ph-lock-key';

                // First Letter for Avatar
                let initial = u.firstName ? u.firstName.charAt(0).toUpperCase() : 'U';

                // GENERATING CARD HTML
                html += `
                    <div class="user-card">
                        <div class="user-header">
                            <div class="avatar-circle">\${initial}</div>
                            <div class="user-info">
                                <h3>\${u.firstName} \${u.lastName}</h3>
                                <p>\${u.email}</p>
                            </div>
                        </div>

                        <div class="detail-row">
                            <span class="detail-label">User ID</span>
                            <span class="detail-value">#\${u.userId}</span>
                        </div>
                        
                        <div class="detail-row">
                            <span class="detail-label">Mobile</span>
                            <span class="detail-value">\${u.mobile ? u.mobile : '-'}</span>
                        </div>

                        <div class="detail-row" style="border:none;">
                            <span class="detail-label">Status</span>
                            <span class="status-badge \${statusClass}">\${statusText}</span>
                        </div>

                        <div class="card-actions">
                            <button onclick="updateStatus(\${u.userId}, '\${u.status}')" class="btn-action \${toggleBtnClass}">
                                <i class="ph-bold \${toggleBtnIcon}"></i> \${toggleBtnText}
                            </button>
                            
                            <button onclick="deleteUser(\${u.userId})" class="btn-action btn-delete">
                                <i class="ph-bold ph-trash"></i> Delete
                            </button>
                        </div>
                    </div>
                `;
            });
            document.getElementById("usersList").innerHTML = html;

        } catch(err) {
            console.error("Error loading users:", err);
            document.getElementById("usersList").innerHTML = 
                `<div class="state-message" style="color:#EF4444;">
                    <i class="ph-bold ph-warning-circle" style="font-size:32px;"></i><br>
                    Error loading data. Is the backend running?
                 </div>`;
        }
    }

    async function deleteUser(id) {
        if(!confirm("Are you sure you want to permanently delete this user?")) return;
        await fetch(BASE_URL + "/" + id, { method: 'DELETE' });
        loadUsers(); 
    }

    async function updateStatus(id, currentStatus) {
        // Toggle logic
        const newStatus = currentStatus === 'ACTIVE' ? 'INACTIVE' : 'ACTIVE';
        await fetch(BASE_URL + "/status/" + id + "?status=" + newStatus, { method: 'PUT' });
        loadUsers(); 
    }
    
    function logout(){
        localStorage.removeItem('admin');
        document.cookie = "jwtToken=; path=/; max-age=0";
        window.location.href='/admin/login';
    }

    // Init
    loadUsers();    
</script>

<style>
@keyframes spin { 100% { transform: rotate(360deg); } }
</style>

</body>
</html> 
