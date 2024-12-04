-- Create table for gym members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    MembershipID INT,
    JoinDate DATE,
    FOREIGN KEY (MembershipID) REFERENCES Memberships(MembershipID)
);

-- Create table for memberships
CREATE TABLE Memberships (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    MembershipType VARCHAR(50),
    Cost DECIMAL(10, 2),
    DurationMonths INT,
    Benefits TEXT
);

-- Create table for classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(50),
    InstructorID INT,
    Schedule DATETIME,
    Capacity INT,
    FOREIGN KEY (InstructorID) REFERENCES Staff(StaffID)
);

-- Create table for staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Create table for class registrations
CREATE TABLE ClassRegistrations (
    RegistrationID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    ClassID INT,
    RegistrationDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- Insert sample data into Memberships
INSERT INTO Memberships (MembershipType, Cost, DurationMonths, Benefits)
VALUES 
('Basic', 30.00, 1, 'Access to gym equipment'),
('Premium', 60.00, 1, 'Access to gym equipment and group classes'),
('VIP', 90.00, 1, 'All-access, including personal training sessions');

-- Insert sample data into Staff
INSERT INTO Staff (FirstName, LastName, Role, Email, PhoneNumber)
VALUES 
('John', 'Doe', 'Instructor', 'jdoe@gym.com', '555-1234'),
('Jane', 'Smith', 'Manager', 'jsmith@gym.com', '555-5678'),
('Emily', 'Johnson', 'Trainer', 'ejohnson@gym.com', '555-9012');

-- Insert sample data into Classes
INSERT INTO Classes (ClassName, InstructorID, Schedule, Capacity)
VALUES 
('Yoga', 1, '2024-12-05 10:00:00', 20),
('Spin', 1, '2024-12-06 18:00:00', 15),
('HIIT', 3, '2024-12-07 09:00:00', 10);

-- Insert sample data into Members
INSERT INTO Members (FirstName, LastName, DateOfBirth, Email, PhoneNumber, MembershipID, JoinDate)
VALUES 
('Alice', 'Brown', '1990-05-10', 'alice.brown@email.com', '555-1111', 2, '2024-01-15'),
('Bob', 'Green', '1985-07-20', 'bob.green@email.com', '555-2222', 1, '2024-03-22');

-- Insert sample data into ClassRegistrations
INSERT INTO ClassRegistrations (MemberID, ClassID, RegistrationDate)
VALUES 
(1, 1, '2024-12-01'),
(2, 2, '2024-12-01');
