
-- Gym Registration System Database Script
-- Developed as a sample project by a student.
-- Special thanks to Professor Behrooz Dindar for his guidance.

-- Create a database for the gym registration system
CREATE DATABASE GymRegistration;
GO

-- Use the created database
USE GymRegistration;
GO

-- Table for athletes (sports club members)
CREATE TABLE Athletes (
    AthleteID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each athlete
    FirstName NVARCHAR(50) NOT NULL,        -- First name of the athlete
    LastName NVARCHAR(50) NOT NULL,         -- Last name of the athlete
    NationalID CHAR(10) NOT NULL UNIQUE,    -- National ID (unique)
    MobileNumber CHAR(11) NOT NULL,         -- Mobile phone number
    RegistrationDate DATE DEFAULT GETDATE() -- Registration date, default is today
);

-- Table for coaches
CREATE TABLE Coaches (
    CoachID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each coach
    FirstName NVARCHAR(50) NOT NULL,        -- First name of the coach
    LastName NVARCHAR(50) NOT NULL,         -- Last name of the coach
    MobileNumber CHAR(11) NOT NULL          -- Mobile phone number
);

-- Table for workout plans
CREATE TABLE WorkoutPlans (
    PlanID INT IDENTITY(1,1) PRIMARY KEY,   -- Unique identifier for each workout plan
    AthleteID INT NOT NULL,                 -- Reference to the athlete
    CoachID INT NOT NULL,                   -- Reference to the coach
    PlanDescription NVARCHAR(MAX),          -- Workout plan description
    CreatedDate DATE DEFAULT GETDATE(),     -- Date the plan was created
    FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
);

-- Sample data for testing
INSERT INTO Athletes (FirstName, LastName, NationalID, MobileNumber)
VALUES
('Ali', 'Ahmadi', '1234567890', '09123456789'),
('Sara', 'Mohammadi', '0987654321', '09351234567');

INSERT INTO Coaches (FirstName, LastName, MobileNumber)
VALUES
('Reza', 'Karimi', '09112223344'),
('Neda', 'Shirazi', '09223344556');

INSERT INTO WorkoutPlans (AthleteID, CoachID, PlanDescription)
VALUES
(1, 1, 'Cardio and strength training, 3 days a week'),
(2, 2, 'Yoga and flexibility exercises, 2 days a week');
