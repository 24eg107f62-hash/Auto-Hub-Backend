# 🚗 Auto Hub: Vehicle Service Management System
## Presentation, Viva-Voce & Project Report Guide

**Student Name:** M. Tharun Teja Reddy  
**Branch & Section:** AIML-F  
**Roll / Hall Ticket ID:** 24EG107F62  
**Institution:** Anurag University  
**Email:** 24eg107f62@anurag.edu.in  

---

## 1. Project Abstract & Executive Summary

The **AutoCare Hub (Auto Hub)** is an enterprise-grade full-stack web application engineered to simplify, streamline, and automate vehicle servicing and workshop operations. The platform provides a centralized hub for vehicle owners and service centers to manage service bookings, customer profiles, vehicle fleet data, service catalogs, spare parts, billing, and real-time repair progress tracking.

### Key Technology Stack:
- **Frontend:** React 18, Vite, Modern CSS3 with Vibrant Dark UI Theme, Lucide Icons
- **Backend:** Java 25 / 17+, Spring Boot 3.4.x, Spring Data JPA, Hibernate ORM
- **Database:** MySQL Server 8.0 (Relational Storage) + Embedded H2 Fallback
- **Security:** Spring Security, BCrypt Password Hashing, Role-Based Access Control (RBAC)
- **API Testing:** Postman REST API Suite with automated JSON collection
- **Architecture:** Client-Server decoupled RESTful micro-architecture

---

## 2. System Architecture & Data Flow

```
┌────────────────────────────────────────────────────────┐
│             REACT 18 FRONTEND (Vite / SPA)             │
│   • Dashboard KPI Charts       • Customer Directory    │
│   • Vehicle Fleet Registry     • Service Catalog       │
│   • Booking Pipeline           • GST Invoices & Bills  │
└───────────────────────────┬────────────────────────────┘
                            │ HTTP / JSON (REST APIs)
                            │ Port: 8080 (Proxy 5173)
┌───────────────────────────▼────────────────────────────┐
│          SPRING BOOT 3.4 BACKEND CONTROLLERS           │
│   • AuthController             • CustomerController    │
│   • VehicleController          • ServiceController     │
│   • BookingController          • InvoiceController     │
│   • PaymentController          • DashboardController   │
└───────────────────────────┬────────────────────────────┘
                            │ Service Layer & Security
┌───────────────────────────▼────────────────────────────┐
│             BUSINESS LOGIC & DATA ACCESS               │
│   • BCrypt Password Encoder    • Transaction Managers  │
│   • Spring Data JPA Repositories (Hibernate ORM)       │
└───────────────────────────┬────────────────────────────┘
                            │ JDBC (HikariCP)
┌───────────────────────────▼────────────────────────────┐
│              MySQL 8.0 RELATIONAL DATABASE             │
│   Tables: users, customer, vehicles, services,         │
│           service_bookings, invoices, payments         │
└────────────────────────────────────────────────────────┘
```

---

## 3. The 6 Main Modules Breakdown

### Module 1: Authentication & Security
- **Registration:** Secure customer & workshop admin signups.
- **Login & Sessions:** Token & role-based validation.
- **BCrypt Encryption:** Passwords are salted and hashed with BCrypt (10 rounds) before persistence; plain text passwords never reach the database.
- **Role Differentiation:** Dedicated capabilities for `ROLE_ADMIN` (Workshop Manager) and `ROLE_CUSTOMER` (Vehicle Owner).
- **1-Click Viva Switcher:** Ability to toggle between Admin and Customer views seamlessly during evaluations.

### Module 2: Customer Management
- **Add Customer:** Capture full name, unique email, phone number, and residential address.
- **View & Search:** Real-time search across customer names, contact numbers, and emails.
- **Update & Edit:** Modify contact details and address in-place.
- **Delete:** Soft/hard removal with relationship constraints.

### Module 3: Vehicle Management
- **Vehicle Number:** State registration identifier (e.g., `TS09-EA-2024`).
- **Brand & Model:** Structured classification (e.g., `Hyundai Creta`, `Tata Nexon EV`).
- **Manufacturing Year:** Model release date validation.
- **Fuel Type Badges:** Color-coded badges for *Petrol, Diesel, Electric, Hybrid, and CNG*.
- **Customer Association:** Foreign-key relation linking vehicle to its owner.

### Module 4: Service Management
- **Service Catalog:** Curated packages (Periodic Maintenance, Brake Overhaul, Synthetic Tune-up, AC Wash, Wheel Alignment, Ceramic Spa).
- **Duration & Labor Rates:** Explicit time estimates and standard procedure costs.
- **Booking Queue:** Multi-stage workflow:
  $$\text{PENDING} \longrightarrow \text{IN\_PROGRESS} \longrightarrow \text{COMPLETED} \ (\text{or CANCELLED})$$

### Module 5: Payment & Invoices
- **Automated Tax Calculation:**
  $$\text{Subtotal} = \text{Service Cost} + \text{Labour Charge} + \text{Spare Parts Cost}$$
  $$\text{GST Tax (18\%)} = \text{Subtotal} \times 0.18$$
  $$\text{Total Payable} = \text{Subtotal} + \text{GST}$$
- **Printable Tax Invoices:** Built-in printable GST tax invoice template with workshop details, customer address, and itemized ledger.
- **Multi-Channel Payments:** UPI, Credit Cards, Debit Cards, Net Banking, and Cash with instant status synchronization (`UNPAID` $\rightarrow$ `PAID`).

### Module 6: Central Dashboard
- **Real-Time KPIs:** Total Revenue, Active Bay Bookings, Registered Fleet Count, Total Customers.
- **Service Bay Status:** Visual distribution of vehicles waiting, under repair, and ready for pickup.
- **Recent Activity Ledger:** Chronological activity log.

---

## 4. Top 25 Viva-Voce Questions & Expert Answers

### Q1: Why did you choose React for frontend and Spring Boot for backend?
> **Answer:** Decoupling the presentation layer from business logic ensures high scalability and flexibility. React provides a reactive, component-based Virtual DOM interface for seamless user experiences without full page reloads. Spring Boot provides an enterprise-ready, robust, and multithreaded backend with built-in dependency injection, transaction management, and first-class JPA support.

### Q2: What is the role of Spring Data JPA and Hibernate in this project?
> **Answer:** Spring Data JPA acts as an abstraction over the Java Persistence API. Hibernate is the underlying Object-Relational Mapping (ORM) implementation. It maps our Java model classes (`User`, `Customer`, `Vehicle`, etc.) directly to MySQL tables, eliminating tedious manual JDBC boilerplate SQL code.

### Q3: How is password security handled in Auto Hub?
> **Answer:** We use Spring Security's `BCryptPasswordEncoder`. BCrypt incorporates a random salt and adaptive work factor (cost 10) to generate irreversible hashes. Even if the database is compromised, passwords cannot be converted back to plain text.

### Q4: Explain the relationship between Customer, Vehicle, and Service Booking.
> **Answer:** 
> - A `Customer` has a One-to-Many relationship with `Vehicle` (one customer can own multiple cars).
> - A `Vehicle` and `Customer` have a One-to-Many relationship with `ServiceBooking` (a vehicle can undergo multiple service appointments over time).
> - Each `ServiceBooking` references both `customer_id` and `vehicle_id` as foreign keys.

### Q5: How do you prevent SQL Injection attacks?
> **Answer:** By using Spring Data JPA and Hibernate parameterized queries (`@Param`, Spring Repository method conventions, and JPA criteria queries). All inputs are sanitized and passed as bound query parameters rather than dynamically concatenated SQL strings.

### Q6: What HTTP methods are used in your REST APIs and why?
> **Answer:**
> - `GET`: Read / retrieve data (idempotent, safe).
> - `POST`: Create new resources (non-idempotent, e.g., register customer, create booking).
> - `PUT` / `PATCH`: Update existing resources.
> - `DELETE`: Remove a record.

### Q7: What is CORS and how did you configure it?
> **Answer:** Cross-Origin Resource Sharing (CORS) is a browser security mechanism that blocks web pages from making AJAX requests to a different domain/port. In Spring Boot, we configured a `CorsConfigurationSource` bean and `@CrossOrigin(origins = "*")` allowing the React client on port `5173` to communicate with the Spring API on port `8080`. In Vite, we also added a proxy configuration.

### Q8: How did you test your REST APIs?
> **Answer:** We used **Postman** to create an API collection covering all endpoints (Authentication, Customers, Vehicles, Services, Bookings, Invoices, Payments, Dashboard). We validated status codes (`200 OK`, `201 Created`, `400 Bad Request`, `404 Not Found`), payload structures, and response timings.

### Q9: How is the invoice total calculated?
> **Answer:** In `InvoiceService.java`, the system calculates:
> `subtotal = serviceCost + labourCost + partsCost`,
> then computes `tax = subtotal * (taxRatePercent / 100)` (typically 18% GST),
> and finally sums `totalAmount = subtotal + tax`.

### Q10: What happens when a payment is recorded?
> **Answer:** In `PaymentService.java`, when a payment is submitted via `POST /api/payments`, the transaction record is saved in the `payments` table, and the corresponding invoice in `invoices` automatically transitions its `paymentStatus` from `UNPAID` to `PAID`.

### Q11: What is the purpose of `@RestController`?
> **Answer:** `@RestController` is a convenience annotation combining `@Controller` and `@ResponseBody`. It tells Spring that all handler methods in the class return domain objects directly serialized into JSON or XML rather than rendering server-side HTML views.

### Q12: What is the difference between `application.properties` and SQL DDL?
> **Answer:** `application.properties` configures Spring Boot runtime properties (database URL, driver, credentials, Hibernate DDL auto settings). SQL DDL (`schema.sql`) explicitly defines tables, columns, indexes, and primary/foreign keys in the relational database.

### Q13: How does React communicate with Spring Boot?
> **Answer:** React uses asynchronous HTTP fetch requests configured in `api/client.js`. Responses are parsed as JSON and stored in React component state (`useState`), triggering reactive UI re-renders.

### Q14: What is the benefit of the Vite build tool over Webpack?
> **Answer:** Vite utilizes native ES modules (ESM) in the browser during development, allowing instant server boot and lightning-fast Hot Module Replacement (HMR) without full bundling. In production, Vite bundles optimized static assets using Rollup.

### Q15: How are roles managed in the frontend?
> **Answer:** `AuthContext.jsx` manages user state. The user object contains `userRole: "ADMIN" | "CUSTOMER"`. The UI dynamically alters displayed badges, permissions, and features depending on the active persona.

---

## 5. Live Project Demo Script (What to do during Presentation)

1. **Start the Project:**
   - Run `.\run-all.ps1` or run `run-backend.bat` and `run-frontend.bat`.
   - Show that the backend starts on `http://localhost:8080` connected to MySQL 8.0.
   - Show the frontend launching on `http://localhost:5173`.

2. **Step 1 - Central Dashboard Walkthrough:**
   - Highlight the **Command Center** with 4 KPI cards: Total Revenue (₹), Active Bookings, Vehicles Registered, and Total Customers.
   - Point out the **Service Workflow Pipeline** showing counts for Queue, Service Bay, and Delivery.

3. **Step 2 - Customer Management:**
   - Click **Customers** in the sidebar.
   - Search for *"Tharun"* in the live search bar.
   - Click **Add New Customer** and register a new client (e.g. *Kavita Deshmukh*).
   - Show that the record updates instantly.

4. **Step 3 - Vehicle Fleet Registry:**
   - Click **Vehicles** in the sidebar.
   - Highlight the vehicle plate badges, fuel category tags (Electric, Petrol, Diesel), and owner mapping.
   - Click **Register Vehicle** and add a car assigned to the customer.

5. **Step 4 - Service Catalog & One-Click Booking:**
   - Click **Services Catalog**. Show the available packages with pricing and estimated durations.
   - Click **Book Service** on a package (e.g., *AC Deep Cleaning & Gas Refill*).
   - Show how the modal opens pre-filled with that service.
   - Submit the booking and view it on the **Service Bookings** page.

6. **Step 5 - Service Workflow & Status Advance:**
   - On the Bookings table, click **Start Bay** to move status from `PENDING` to `IN_PROGRESS`.
   - Click **Complete** to advance it to `COMPLETED`.

7. **Step 6 - Invoice Generation & Printing:**
   - Click **Bill** directly on the booking.
   - Observe the automatic GST tax and total calculations.
   - Click **Print** to open the professional branded tax invoice receipt.

8. **Step 7 - Payment Settlement:**
   - Click **Pay** on the invoice.
   - Select **UPI** or **Credit Card** and confirm.
   - Watch the status badge transition from `UNPAID` to `PAID` with green glow.
   - Return to **Dashboard** and show the total revenue and metrics update in real-time!

9. **Step 8 - Postman REST API Showcase:**
   - Open Postman, show the `AutoHub_Postman_Collection.json`.
   - Execute `GET /api/dashboard/stats` and `GET /api/bookings` to prove RESTful backend decoupling.
