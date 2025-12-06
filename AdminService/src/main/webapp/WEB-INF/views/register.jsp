<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

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
    
    --grad-primary: linear-gradient(135deg, #6366F1, #4F46E5);
    
    --radius-card: 16px;      
    --radius-input: 8px;
    --shadow-card: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

body {
    
    background: linear-gradient(to bottom, #E0E7FF 0%, #F3F4F6 30%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
    color: var(--text-main);
}

.card {
    width: 100%;
    max-width: 800px;
    background: var(--bg-card);
    padding: 48px 48px; 
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    border: none;
    
    border-top: 6px solid var(--c-primary);
    
    animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
    max-height: 90vh;
    overflow-y: auto;
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    text-align: center;
    font-size: 28px;
    font-weight: 800;
    margin-bottom: 35px;
    color: var(--text-main);
    letter-spacing: -0.025em;
}

.section-title {
    margin: 35px 0 20px;
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.2px;
    color: var(--c-primary);
   
    background: var(--bg-primary-soft);
    padding: 10px 16px;
    border-radius: 6px;
    border-bottom: none;
    display: inline-block; 
    width: 100%; 
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px; 
}

.form-group { margin-bottom: 0; }
.full-width { grid-column: span 2; }

label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 8px;
}

.required { color: var(--c-secondary); font-weight: bold; }

input, select {
    width: 100%;
    padding: 12px 16px;
    border-radius: var(--radius-input);
    border: 1px solid #E5E7EB;
    background: #FFFFFF; 
    font-size: 14px;
    color: var(--text-main);
    transition: all 0.2s ease;
}

input:focus, select:focus {
    background: #FFFFFF;
    border-color: var(--c-primary);
    box-shadow: 0 4px 12px rgba(99, 102, 241, 0.15); 
    outline: none;
    transform: translateY(-1px);
}

.btn {
    width: 100%;
    padding: 16px;
    background: var(--text-main); 
    border: none;
    border-radius: var(--radius-input);
    font-size: 15px;
    font-weight: 600;
    color: white;
    cursor: pointer;
    transition: all 0.2s;
    margin-top: 40px;
}

.btn:hover {
    background: var(--c-primary); 
    transform: translateY(-2px);
    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.3);
}

.message {
    padding: 16px;
    border-radius: var(--radius-input);
    text-align: center;
    font-size: 14px;
    font-weight: 500;
    display: none;
    margin-bottom: 25px;
}
.error { background: #FEF2F2; color: #991B1B; border: 1px solid #FECACA; }
.success { background: #ECFDF5; color: #065F46; border: 1px solid #A7F3D0; }

.link {
    text-align: center;
    margin-top: 28px;
    font-size: 14px;
    color: var(--text-muted);
}
.link a { color: var(--c-primary); font-weight: 600; text-decoration: none; transition:0.2s; }
.link a:hover { text-decoration: underline; color: var(--c-hover); }

.card::-webkit-scrollbar { width: 6px; }
.card::-webkit-scrollbar-track { background: transparent; }
.card::-webkit-scrollbar-thumb { background-color: #E5E7EB; border-radius: 20px; }

@media(max-width: 700px){
    .form-row { grid-template-columns: 1fr; gap: 16px; }
    .full-width { grid-column: span 1; }
    .card { padding: 30px 24px; }
    body { padding: 20px 10px; }
}
</style>
</head>

<body>

<div class="card">

    <h2>Create Account</h2>

    <div id="message" class="message"></div>

    <form id="registerForm">

        <div class="section-title">Personal Information</div>

        <div class="form-row">
            <div class="form-group">
                <label>First Name <span class="required">*</span></label>
                <input type="text" name="firstName" required>
            </div>
            <div class="form-group">
                <label>Last Name <span class="required">*</span></label>
                <input type="text" name="lastName" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Username <span class="required">*</span></label>
                <input type="text" name="userName" required>
            </div>
            <div class="form-group">
                <label>Email <span class="required">*</span></label>
                <input type="email" name="email" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Password <span class="required">*</span></label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>Mobile</label>
                <input type="text" name="mobile">
            </div>
        </div>

        <div class="section-title">Address Information</div>

        <div class="form-group full-width">
            <label>Address Line 1</label>
            <input type="text" name="address1">
        </div>

        <div class="form-group full-width">
            <label>Address Line 2</label>
            <input type="text" name="address2">
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>City</label>
                <input type="text" name="city">
            </div>

            <div class="form-group">
                <label>State</label>
                <input type="text" name="state">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>ZIP/Postal Code</label>
                <input type="text" name="zipCode">
            </div>
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country">
            </div>
        </div>

        <button type="submit" class="btn">Register</button>
    </form>

    <div class="link">
        Already have an account? <a href="/login">Login here</a>
    </div>

</div>

<script>
document.getElementById('registerForm').addEventListener('submit',async function(e){
    e.preventDefault();

    const data={
        firstName:this.firstName.value.trim(),
        lastName:this.lastName.value.trim(),
        userName:this.userName.value.trim(),
        password:this.password.value,
        email:this.email.value.trim(),
        mobile:this.mobile.value.trim()||null,
        address1:this.address1.value.trim()||null,
        address2:this.address2.value.trim()||null,
        city:this.city.value.trim()||null,
        state:this.state.value.trim()||null,
        zipCode:this.zipCode.value.trim()||null,
        country:this.country.value.trim()||null
    };

    const msg=document.getElementById('message');
    // Button state handling (No HTML change, just JS logic)
    const btn = this.querySelector('button');
    const originalText = btn.textContent;
    btn.textContent = "Processing...";
    btn.disabled = true;

    try{
        // Calling UserService on port 8081
        const res=await fetch('http://localhost:8081/api/users/register',{
            method:'POST',
            headers:{'Content-Type':'application/json'},
            body:JSON.stringify(data)
        });

        if(res.ok){
            msg.className='message success';
            msg.textContent='Registration successful! Redirecting...';
            msg.style.display='block';
            this.reset();
            // Redirect to Login Page on Port 8082
            setTimeout(()=>window.location.href='/login',1200);
        }else{
            msg.className='message error';
            msg.textContent=await res.text()||'Registration failed';
            msg.style.display='block';
            btn.textContent = originalText;
            btn.disabled = false;
        }
    }catch(err){
        msg.className='message error';
        msg.textContent='Error: '+err.message;
        msg.style.display='block';
        btn.textContent = originalText;
        btn.disabled = false;
    }
});
</script>

</body>
</html>

