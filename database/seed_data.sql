-- ============================================================
-- AUTO HUB: Vehicle Service Management System
-- Seed Data for MySQL 8.0+
-- Author: M. Tharun Teja Reddy (24EG107F62)
-- ============================================================

USE autohub;

-- 1. Insert Initial Users (Passwords hashed with BCrypt)
-- Admin: admin@autohub.com / admin123
-- Customer: tharun@gmail.com / tharun123
INSERT INTO users (id, name, email, password, role, user_role, phone) VALUES
(1, 'AutoHub Admin', 'admin@autohub.com', '$2a$10$7.we4UY1yEbAIPrlvqJzM.fzjv00iMZfYzxwftJwAfLF6JTca5QYO', 'ROLE_ADMIN', 'ADMIN', '+91 9876543210'),
(2, 'Tharun Reddy', 'tharun@gmail.com', '$2a$10$7.we4UY1yEbAIPrlvqJzM.fzjv00iMZfYzxwftJwAfLF6JTca5QYO', 'ROLE_CUSTOMER', 'CUSTOMER', '9876543210')
ON DUPLICATE KEY UPDATE name=VALUES(name);

-- 2. Insert Customers
INSERT INTO customer (id, name, email, phone, address) VALUES
(1, 'Tharun Reddy', 'tharun@gmail.com', '9876543210', 'Hyderabad, Telangana'),
(2, 'Priya Sharma', 'priya.sharma@gmail.com', '9812345678', 'Madhapur, Hyderabad'),
(3, 'Rahul Varma', 'rahul.varma@gmail.com', '9845612345', 'Banjara Hills, Hyderabad'),
(4, 'Ananya Rao', 'ananya.rao@gmail.com', '9701234567', 'Gachibowli, Hyderabad')
ON DUPLICATE KEY UPDATE name=VALUES(name);

-- 3. Insert Services Catalog
INSERT INTO services (id, service_name, description, cost, duration_minutes) VALUES
(1, 'Periodic Maintenance & Oil Change', 'Complete engine oil drain and refill with genuine filter replacement, 40-point safety check', 1899.0, 60),
(2, 'Brake System Inspection & Pad Replacement', 'Front and rear brake disc inspection, brake fluid top-up, pad replacement', 2499.0, 90),
(3, 'Full Synthetic Engine Tune-Up', 'Premium synthetic oil replacement, spark plug cleaning, throttle body servicing, engine scanning', 4500.0, 120),
(4, 'AC Deep Cleaning & Gas Refill', 'Evaporator foam wash, AC condenser cleaning, cabin filter replacement, R134a refrigerant charge', 2199.0, 75),
(5, 'Wheel Alignment & 3D Balancing', 'Computerized 4-wheel laser alignment, wheel balancing with counterweights, tire rotation', 999.0, 45),
(6, 'Complete Car Spa & Ceramic Wash', 'High-pressure foam wash, interior vacuuming, dashboard polish, glass treatment, underbody wash', 1499.0, 90),
(7, 'Battery Health Check & Replacement', 'Cold cranking amps (CCA) test, terminal cleaning, voltage drop analysis, battery swap', 3200.0, 30)
ON DUPLICATE KEY UPDATE service_name=VALUES(service_name);

-- 4. Insert Vehicles
INSERT INTO vehicles (id, vehicle_number, brand, model, year, fuel_type, customer_id) VALUES
(1, 'TS09-EA-2024', 'Hyundai', 'Creta SX(O)', 2023, 'Petrol', 1),
(2, 'TS08-HB-1007', 'Tata', 'Nexon EV Max', 2024, 'Electric', 1),
(3, 'TS07-FX-4589', 'Honda', 'City ZX', 2022, 'Petrol', 2),
(4, 'TS10-AB-9921', 'Mahindra', 'XUV700 AX7', 2023, 'Diesel', 3)
ON DUPLICATE KEY UPDATE vehicle_number=VALUES(vehicle_number);

-- 5. Insert Service Bookings
INSERT INTO service_bookings (id, customer_id, vehicle_id, service_type, service_date, status, description) VALUES
(1, 1, 1, 'Periodic Maintenance & Oil Change', '2026-10-05', 'COMPLETED', 'Routine 10,000 KM service. Change engine oil and check air filters.'),
(2, 1, 2, 'AC Deep Cleaning & Gas Refill', '2026-10-09', 'IN_PROGRESS', 'AC cooling slightly weak during daytime driving.'),
(3, 2, 3, 'Wheel Alignment & 3D Balancing', '2026-10-12', 'PENDING', 'Minor steering pull to the left at highway speeds.')
ON DUPLICATE KEY UPDATE status=VALUES(status);

-- 6. Insert Invoices
INSERT INTO invoices (id, booking_id, customer_id, vehicle_id, invoice_date, service_cost, labour_cost, parts_cost, tax, total_amount, payment_status) VALUES
(1, 1, 1, 1, '2026-10-05', 1899.0, 500.0, 450.0, 512.82, 3361.82, 'PAID'),
(2, 2, 1, 2, '2026-10-08', 2199.0, 650.0, 300.0, 566.82, 3715.82, 'UNPAID')
ON DUPLICATE KEY UPDATE total_amount=VALUES(total_amount);

-- 7. Insert Payments
INSERT INTO payments (id, invoice_id, amount, payment_date, payment_method, payment_status) VALUES
(1, 1, 3361.82, '2026-10-05', 'UPI', 'COMPLETED')
ON DUPLICATE KEY UPDATE amount=VALUES(amount);
