
## 🚀 Project Overview

The Music Library consists of multiple microservices, each responsible for a dedicated functionality.  
Both **Admin** and **User** roles have separate services and databases to ensure modularity, scalability, and clean architecture.

This project demonstrates:

- Microservices architecture with Spring Boot  
- Service discovery using Eureka  
- Independent databases using MySQL  
- REST API communication  
- Secure login using Spring Security + JWT  
- CRUD operations for Users, Admins, Songs, and Playlists  
- Email notifications using a dedicated microservice  

---

# 🧑‍💻 User Stories

### **User Functionalities**

1. Register, login, and logout using email, phone number, and personal details.  
2. View all available songs in the music library.  
3. View detailed song information including:  
   - Song name  
   - Singer  
   - Music director  
   - Release date  
   - Album name  
4. Search songs using **music director**, **album**, or **artist**.  
5. Create one or multiple playlists.  
6. Search songs inside a playlist by song name.  
7. Perform **CRUD** operations on playlists.  
8. Perform **CRUD** on songs inside playlists.  
9. Use playlist controls: **play**, **stop**, **repeat**, **shuffle**.  
10. View all playlists created by the user.  
11. Add one or more songs into the playlist.

---

# 🛠 Admin Stories

### **Admin Functionalities**

1. Login and logout as an admin.  
2. Perform **CRUD** on songs and the complete song library.  
3. Restrict the visibility of selected songs from users.  
4. Send notifications whenever a new song is added (email alerts).

# Each microservice:
- Has its own controller, service, repository, and database  
- Communicates independently  
- Uses JWT for authentication  

---
# 🔐 Authentication Flow (JWT)

1. User/Admin logs in → JWT issued  
2. JWT added to Authorization header for every request  
3. Spring Security validates token in filter  
# 🧪 Technologies Used

| Layer | Technologies |
|------|--------------|
| Backend | Spring Boot, Eureka, MYSQL DB, JPA, Hibernate |
| Security | Spring Security, JWT |
| Communication | REST APIs |
| Notifications | JavaMailSender |
| Frontend | HTML, CSS, JSP, Fetch API |

# 📝 Author

**Ritika Tripathi**  
📧 Email: ritikatripathi164@gmail.com
