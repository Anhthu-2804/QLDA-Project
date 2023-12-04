create database bookve 
use bookve 
CREATE TABLE Bill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    createdTime DATETIME,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);
CREATE TABLE Branch (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imgURL VARCHAR(2000),
    name VARCHAR(255),
    diaChi VARCHAR(255),
    phoneNo VARCHAR(255)
);
CREATE TABLE Movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    smallImageURL VARCHAR(1000),
    shortDescription VARCHAR(500),
    longDescription VARCHAR(1000),
    largeImageURL VARCHAR(1000),
    director VARCHAR(255),
    actors VARCHAR(255),
    categories VARCHAR(255),
    releaseDate DATE,
    duration INT,
    trailerURL VARCHAR(1000),
    language VARCHAR(255),
    rated VARCHAR(255),
    isShowing INT
);
CREATE TABLE Role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE Room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    totalArea DOUBLE,
    imgURL VARCHAR(1000),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(id) ON DELETE CASCADE
);
CREATE TABLE Schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    startDate DATE,
    startTime TIME,
    price DOUBLE,
    movie_id INT,
    branch_id INT,
    room_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branch(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Room(id) ON DELETE CASCADE
);
CREATE TABLE Seat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Room(id) ON DELETE CASCADE
);
CREATE TABLE Ticket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    qrImageURL VARCHAR(1000),
    seat_id INT,
    schedule_id INT,
    bill_id INT,
    FOREIGN KEY (seat_id) REFERENCES Seat(id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id) REFERENCES Schedule(id) ON DELETE CASCADE,
    FOREIGN KEY (bill_id) REFERENCES Bill(id) ON DELETE CASCADE
);
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullName VARCHAR(255) NOT NULL
);
CREATE TABLE users_roles (
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (role_id) REFERENCES Role(id),
    PRIMARY KEY (user_id, role_id)
);
