create database Clinicdb; 
use Clinicdb;
-- Create the Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(150) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- Create the Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(150) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Create the TimeSlots table
CREATE TABLE TimeSlots (
    timeslot_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    slot_time TIME NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create the Appointments table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    UNIQUE(patient_id, appointment_date, appointment_time)
);

-- Insert sample data into the Doctors table
INSERT INTO Doctors (doctor_name, specialization, contact_number, email)
VALUES 
('Dr. John Doe', 'Cardiologist', '0712345678', 'johndoe@clinic.com'),
('Dr. Jane Smith', 'Dermatologist', '0723456789', 'janesmith@clinic.com'),
('Dr. Emily White', 'Pediatrician', '0734567890', 'emilywhite@clinic.com');

-- Insert sample data into the Patients table
INSERT INTO Patients (patient_name, date_of_birth, contact_number, email)
VALUES 
('Alice Brown', '1990-05-15', '0701234567', 'alicebrown@patient.com'),
('Bob Green', '1985-11-30', '0723456789', 'bobgreen@patient.com'),
('Charlie Black', '2000-01-25', '0734567890', 'charlieblack@patient.com');

-- Insert sample data into the TimeSlots table
INSERT INTO TimeSlots (doctor_id, slot_time, date)
VALUES 
(1, '09:00:00', '2025-05-13'),
(1, '10:00:00', '2025-05-13'),
(2, '11:00:00', '2025-05-14'),
(2, '12:00:00', '2025-05-14'),
(3, '14:00:00', '2025-05-15'),
(3, '15:00:00', '2025-05-15');

-- Insert sample data into the Appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES 
(1, 1, '2025-05-13', '09:00:00', 'Scheduled'),
(2, 2, '2025-05-14', '11:00:00', 'Scheduled'),
(3, 3, '2025-05-15', '14:00:00', 'Scheduled');
