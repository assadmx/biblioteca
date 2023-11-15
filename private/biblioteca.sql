CREATE DATABASE IF NOT EXISTS library_system;

USE library_system;

CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    status ENUM('aviable', 'not aviable') DEFAULT 'aviable',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'reader') DEFAULT 'reader',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP  NULL
);

CREATE TABLE IF NOT EXISTS book_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    request_date DATE,
    return_date DATE,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP , NULL
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO users (username, password, role) VALUES ('admin', '1234', 'admin');
INSERT INTO users (username, password, role) VALUES ('lector1', '1234', 'reader');
INSERT INTO users (username, password, role) VALUES ('lector2', '1234', 'reader');
INSERT INTO books (title, author, description, image_url, status) VALUES
('Libro 1', 'Autor 1', 'Descripción del Libro 1', 'imagen1.jpg', 'available'),
('Libro 2', 'Autor 2', 'Descripción del Libro 2', 'imagen2.jpg', 'available'),
('Libro 3', 'Autor 3', 'Descripción del Libro 3', 'imagen3.jpg', 'available'),
('Libro 4', 'Autor 4', 'Descripción del Libro 4', 'imagen4.jpg', 'available'),
('Libro 5', 'Autor 5', 'Descripción del Libro 5', 'imagen5.jpg', 'available');
