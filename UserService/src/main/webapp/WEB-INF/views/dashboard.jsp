<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
<%--
:root{
    --bg:#F5F5F7;
    --surface:#FFFFFF;
    --surface-muted:#FAFAFC;
    --text-primary:#1D1D1F;
    --text-secondary:#6E6E73;
    --accent:#FF2D55;
    --accent-hover:#e61a45;
    --danger:#FF3B30;
    --danger-hover:#d72a21;
    --border:#E5E5EA;
    --radius:18px;
    --shadow:0 14px 40px rgba(0,0,0,0.10);
    --shadow-strong:0 18px 50px rgba(0,0,0,0.18);
}

*{margin:0;padding:0;box-sizing:border-box;font-family:-apple-system,Inter,sans-serif;}

body{
    background:var(--bg);
    min-height:100vh;
}

.navbar{
    background:var(--surface);
    padding:22px 40px;
    border-bottom:1px solid var(--border);
    box-shadow:var(--shadow-strong);
    border-bottom-left-radius:20px;
    border-bottom-right-radius:20px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    font-size:22px;
    font-weight:800;
    color:var(--text-primary);
}

.logout-btn{
    padding:10px 22px;
    background:var(--danger);
    border-radius:var(--radius);
    border:none;
    color:white;
    font-size:15px;
    font-weight:700;
    cursor:pointer;
    transition:.25s;
}
.logout-btn:hover{
    background:var(--danger-hover);
    transform:translateY(-2px);
}

.container{
    max-width:1100px;
    margin:45px auto;
    padding:20px;
}

.user-info{
    background:var(--surface);
    padding:35px;
    border-radius:var(--radius);
    border:1px solid var(--border);
    box-shadow:var(--shadow);
    animation:fade .6s ease;
    
     

 
    
}

.user-info h3{
    font-size:28px;
    font-weight:800;
    color:var(--text-primary);
    margin-bottom:10px;
}
.user-info p{
    font-size:16px;
    color:var(--text-secondary);
}

@keyframes fade{from{opacity:0;transform:translateY(16px);}to{opacity:1;transform:translateY(0);} }

.btn{
    padding:15px 28px;
    background:var(--accent);
    color:white;
    text-decoration:none;
    border-radius:var(--radius);
    font-size:16px;
    font-weight:700;
    display:inline-block;
    transition:.25s;
    margin-top:25px;
}
.btn:hover{
    background:var(--accent-hover);
    transform:translateY(-2px);
    box-shadow:var(--shadow);
}--%>

</style>
</head>

<body>
 


<div class="navbar">
    🎵 Music Library — User Dashboard
    <button class="logout-btn" onclick="logout()">Logout</button>
</div>

<div class="container">

    <div class="user-info">
        <h3>Welcome, <span id="userName"></span> 👋</h3>
        <p>Email: <span id="userEmail"></span></p>
    </div>

    <a href="http://localhost:8082/admin/songs" class="btn">🎵 View All Songs</a>
</div>

<script>
 
 
const user = JSON.parse(localStorage.getItem('user'));

if(!user){
    window.location.href='/login';
}else{
    document.getElementById('userName').textContent = user.firstName + ' ' + user.lastName;
    document.getElementById('userEmail').textContent = user.email;
}

function logout(){
    localStorage.removeItem('user');
    window.location.href='/';
}
</script>

</body>
</html>
