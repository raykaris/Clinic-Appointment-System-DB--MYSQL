CREATE DATABASE watu-clinic

USE watu-clinic


-- Create Department Table
CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctor Table
CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create Patient Table
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    address TEXT
);

-- Create Appointment Table
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Medical Record Table
CREATE TABLE MedicalRecord (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_date DATE NOT NULL,
    diagnosis TEXT,
    prescription TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Sample Data Inserts

-- Departments
INSERT INTO Department (name) VALUES
('General Medicine'),
('Pediatrics'),
('Cardiology');

-- Doctors
INSERT INTO Doctor (name, specialization, phone, email, dept_id) VALUES
('Dr. Alice Mwangi', 'General Physician', '0711223344', 'alice@clinic.com', 1),
('Dr. Brian Kamau', 'Pediatrician', '0722334455', 'brian@clinic.com', 2),
('Dr. Carol Wanjiru', 'Cardiologist', '0733445566', 'carol@clinic.com', 3);

-- Patients
INSERT INTO Patient (name, date_of_birth, gender, phone, email, address) VALUES
('John Doe', '1990-06-15', 'Male', '0700111222', 'john@example.com', 'Nairobi'),
('Jane Njeri', '1985-11-03', 'Female', '0700222333', 'jane@example.com', 'Embu');

-- Appointments
INSERT INTO Appointment (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-05-10 10:00:00', 'Scheduled', 'Routine check-up'),
(2, 3, '2025-05-11 14:00:00', 'Completed', 'Follow-up on blood pressure');

-- Medical Records
INSERT INTO MedicalRecord (patient_id, doctor_id, visit_date, diagnosis, prescription) VALUES
(2, 3, '2025-05-01', 'Hypertension', 'Atenolol 50mg once daily'),
(1, 1, '2025-04-28', 'Mild cold', 'Rest and fluids');
