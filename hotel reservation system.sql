-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    IDNumber VARCHAR(50)
);

-- Create RoomTypes table
CREATE TABLE RoomTypes (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50),
    Description TEXT,
    PricePerNight DECIMAL(10, 2)
);

-- Create Rooms table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10),
    TypeID INT,
    Status VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (TypeID) REFERENCES RoomTypes(TypeID)
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Create Payments table (optional)
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(10, 2),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Method VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
-- Insert room types
INSERT INTO RoomTypes (TypeName, Description, PricePerNight)
VALUES ('Single', 'Single bed room', 50.00),
       ('Double', 'Double bed room', 75.00),
       ('Suite', 'Luxury suite', 150.00);

-- Add a room
INSERT INTO Rooms (RoomNumber, TypeID, Status) VALUES ('101', 1, 'Available');

-- Add a customer
INSERT INTO Customers (FullName, Email, Phone, IDNumber)
VALUES ('John Doe', 'john@example.com', '1234567890', 'ID1234');

-- Book a room
INSERT INTO Bookings (CustomerID, RoomID, CheckInDate, CheckOutDate)
VALUES (1, 1, '2025-05-01', '2025-05-05');

-- Show all current bookings
SELECT * FROM Bookings;

