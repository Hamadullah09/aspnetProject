Database Initialization Script (InitDB.sql)   -- Create Users Table 
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Admin', 'Faculty', 'ITStaff')),
    CreatedAt DATETIME DEFAULT GETDATE()
);
-- Create Complaints Table
CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    DateSubmitted DATETIME DEFAULT GETDATE(),
    Status VARCHAR(30) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'In Progress', 'Resolved')),
    AssignedTo INT NULL,
    Remarks VARCHAR(500),
    UpdatedAt DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID)
);
-- Insert Sample Data
INSERT INTO Users (Username, Email, Password, Role) VALUES
('Admin User', 'admin@cms.com', 'lfQMo8BS8tPTZDXSIC9/jiverHnYLJAAfgISQ90CjFE=', 'Admin'),
('John IT Staff', 'john@cms.com', 'lfQMo8BS8tPTZDXSIC9/jiverHnYLJAAfgISQ90CjFE=', 'ITStaff'),
('Jane Faculty', 'jane@cms.com', 'lfQMo8BS8tPTZDXSIC9/jiverHnYLJAAfgISQ90CjFE=', 'Faculty');
-- Sample Complaints
INSERT INTO Complaints (UserID, Title, Description, Status, AssignedTo) VALUES
(3, 'Projector Not Working', 'The projector in lecture hall A is not displaying properly', 'In Progress', 2),
(3, 'WiFi Issues in Lab', 'WiFi connectivity is very poor in computer lab', 'Pending', NULL);