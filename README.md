# 🚗 AUTO HUB — Vehicle Service Management System

A full-stack enterprise web application developed with **React (Frontend)**, **Java Spring Boot (Backend)**, and **MySQL (Database)**.

Developed by **M. Tharun Teja Reddy** (ID: `24EG107F62`, Branch: `AIML-F`, Anurag University).

---

## 🌟 Overview & Key Features

Auto Hub provides end-to-end automation for vehicle service workshops:
1. **Authentication & Roles:** User registration, login, BCrypt password hashing, Customer and Admin roles.
2. **Customer Management:** Full CRUD (Create, Read, Update, Delete) with live multi-field search.
3. **Vehicle Fleet Registry:** Plate numbers, brand, model, year, fuel classification (Petrol, Diesel, EV, Hybrid, CNG), and customer association.
4. **Service Catalog & Booking:** Comprehensive maintenance packages, duration estimates, live booking queue with status transitions (`PENDING` ➔ `IN_PROGRESS` ➔ `COMPLETED` ➔ `CANCELLED`).
5. **Billing & Invoices:** Automatic calculation of labor charges, parts costs, and 18% GST tax, plus a branded printable tax invoice template.
6. **Payment Transactions:** Multi-channel settlement tracking (UPI, Credit Card, Net Banking, Cash) with real-time status synchronization (`UNPAID` ➔ `PAID`).
7. **Interactive Dashboard:** Real-time KPI metrics, active service bay counters, revenue calculations, and recent activity logs.
8. **Dark & Vibrant UI:** Sleek obsidian theme with neon cyan, emerald, amber, and violet accents, glassmorphic cards, and smooth transitions.

---

## 🛠️ Technology Stack

| Layer | Technologies |
|---|---|
| **Frontend** | React 18, Vite, Modern CSS3 with Vibrant Dark UI Theme, Lucide Icons |
| **Backend** | Java 25 / 17+, Spring Boot 3.4.5, Spring Security, Spring Data JPA, Hibernate ORM |
| **Database** | MySQL Server 8.0 (Relational storage) + Embedded H2 Database Fallback |
| **APIs** | RESTful HTTP/JSON APIs, CORS enabled, tested via Postman |
| **Build Tools** | Apache Maven 3.9+, Node.js 24+, npm 11+ |

---

## 🚀 Quick Start (Running the Application)

### Option 1: 1-Click Launch (PowerShell)
From the `autohub` root directory:
```powershell
.\run-all.ps1
```
This automatically starts both the Spring Boot Backend (Port 8081) and React Frontend (Port 5173) in separate windows.

---

### Option 2: Manual Start

#### 1. Backend (Spring Boot)
```powershell
cd backend
mvn spring-boot:run
```
- API Base URL: `http://localhost:8081/api`
- Connected to MySQL 8.0 on `localhost:3306` (database: `autohub`).
- Baseline demo data and accounts are automatically seeded on first launch!

#### 2. Frontend (React + Vite)
```powershell
cd frontend
npm install
npm run dev
```
- Open your browser at: `http://localhost:5173`

---

## 🔑 Demo Credentials (1-Click Login on UI)

| Role | Email | Password |
|---|---|---|
| **Workshop Admin** | `admin@autohub.com` | `admin123` |
| **Customer** | `tharun@gmail.com` | `tharun123` |

*(Note: The UI also features a 1-click "Switch to Admin / Customer View" pill in the navigation bar for instant persona switching during project evaluations and viva).*

---

## 🗄️ Database Structure (MySQL 8.0)

SQL scripts are provided in the `database/` folder:
- `database/schema.sql`: Complete DDL schema creation.
- `database/seed_data.sql`: Initial sample data for users, customers, vehicles, services, bookings, invoices, and payments.

To manually re-apply into MySQL:
```powershell
mysql -u root -proot < database/schema.sql
mysql -u root -proot < database/seed_data.sql
```

---

## 📬 Postman REST API Collection

The project includes an importable Postman collection:
- File: `postman/AutoHub_Postman_Collection.json`
- Includes pre-configured requests with JSON bodies for:
  - Auth (`/api/auth/register`, `/api/auth/login`, `/api/auth/change-password`)
  - Customers (`/api/customers`, `/api/customers/search`)
  - Vehicles (`/api/vehicles`, `/api/vehicles/customer/{id}`)
  - Services (`/api/services`)
  - Bookings (`/api/bookings`, `/api/bookings/{id}/status`)
  - Invoices (`/api/invoices`, `/api/invoices/booking/{id}`)
  - Payments (`/api/payments`)
  - Dashboard (`/api/dashboard/stats`)

---

## 📁 Project Directory Structure

```
autohub/
├── backend/
│   ├── pom.xml
│   ├── src/main/java/com/autohub/
│   │   ├── AutoHubApplication.java
│   │   ├── config/ (SecurityConfig, DataInitializer)
│   │   ├── model/ (User, Customer, Vehicle, ServiceEntity, ServiceBooking, Invoice, Payment)
│   │   ├── repository/ (JPA Repositories)
│   │   ├── service/ (Business Logic Services)
│   │   ├── controller/ (REST Controllers)
│   │   └── dto/ (Data Transfer Objects)
│   └── src/main/resources/
│       ├── application.properties (MySQL default)
│       └── application-h2.properties (H2 fallback)
├── frontend/
│   ├── package.json
│   ├── vite.config.js
│   ├── index.html
│   └── src/
│       ├── main.jsx
│       ├── App.jsx
│       ├── index.css (Dark vibrant styling)
│       ├── api/ (client.js)
│       ├── context/ (AuthContext.jsx)
│       ├── components/ (Navbar, Sidebar, StatCard, Modal)
│       └── pages/ (Dashboard, Customers, Vehicles, Services, Bookings, Invoices, Payments, LoginModal)
├── database/
│   ├── schema.sql
│   └── seed_data.sql
├── postman/
│   └── AutoHub_Postman_Collection.json
├── PRESENTATION_AND_VIVA_GUIDE.md
├── run-all.ps1
├── run-backend.bat
├── run-frontend.bat
└── README.md
```

---

## 🎓 Viva & Presentation Guide

Refer to [PRESENTATION_AND_VIVA_GUIDE.md](file:///C:/Users/tharu/.gemini/antigravity/scratch/autohub/PRESENTATION_AND_VIVA_GUIDE.md) for:
- Complete system architecture diagrams.
- Top 25 viva-voce technical questions & answers.
- Step-by-step evaluation demo script.
