-- ============================================================
-- AUTO HUB: Vehicle Service Management System
-- Database Schema for MySQL 8.0+
-- Author: M. Tharun Teja Reddy (24EG107F62)
-- ============================================================

CREATE DATABASE IF NOT EXISTS autohub;
USE autohub;

-- 1. Users Table (Authentication & Roles)
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) DEFAULT 'ROLE_CUSTOMER',
    user_role VARCHAR(255) DEFAULT 'CUSTOMER',
    phone VARCHAR(255)
);

-- 2. Customer Table
CREATE TABLE IF NOT EXISTS customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

-- 3. Vehicles Table
CREATE TABLE IF NOT EXISTS vehicles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    vehicle_number VARCHAR(255) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    fuel_type VARCHAR(255) DEFAULT 'Petrol',
    customer_id BIGINT,
    INDEX idx_cust_id (customer_id)
);

-- 4. Services Table (Service Catalog)
CREATE TABLE IF NOT EXISTS services (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    cost DOUBLE NOT NULL,
    duration_minutes INT NOT NULL
);

-- 5. Service Bookings Table
CREATE TABLE IF NOT EXISTS service_bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    vehicle_id BIGINT NOT NULL,
    service_type VARCHAR(255) NOT NULL,
    service_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL DEFAULT 'PENDING',
    description VARCHAR(255),
    INDEX idx_booking_cust (customer_id),
    INDEX idx_booking_veh (vehicle_id)
);

-- 6. Invoices Table
CREATE TABLE IF NOT EXISTS invoices (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    booking_id BIGINT,
    customer_id BIGINT NOT NULL,
    vehicle_id BIGINT NOT NULL,
    invoice_date DATE NOT NULL,
    service_cost DOUBLE NOT NULL,
    labour_cost DOUBLE NOT NULL,
    parts_cost DOUBLE NOT NULL,
    tax DOUBLE NOT NULL,
    total_amount DOUBLE NOT NULL,
    payment_status VARCHAR(255) NOT NULL DEFAULT 'UNPAID',
    INDEX idx_inv_cust (customer_id)
);

-- 7. Payments Table
CREATE TABLE IF NOT EXISTS payments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    invoice_id BIGINT NOT NULL,
    amount DOUBLE NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(255) NOT NULL,
    payment_status VARCHAR(255) NOT NULL DEFAULT 'COMPLETED',
    INDEX idx_pay_inv (invoice_id)
);
