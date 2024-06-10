create DATABASE monger_store

USE monger_store;

-- Products --
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    category ENUM('Shirt', 'Hat', 'Pants', 'Sticker', 'Mug') NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Shirts Table
CREATE TABLE Shirts (
    product_id INT,
    size ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    color ENUM('Red', 'Blue', 'Green', 'Black', 'White'),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Hats Table
CREATE TABLE Hats (
    product_id INT,
    color ENUM('Red', 'Blue', 'Green', 'Black', 'White'),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Pants Table
CREATE TABLE Pants (
    product_id INT,
    size ENUM('28', '30', '32', '34', '36', '38', '40'),
    color ENUM('Red', 'Blue', 'Green', 'Black', 'White'),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Stickers Table
CREATE TABLE Stickers (
    product_id INT,
    pack_size INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Mugs Table
CREATE TABLE Mugs (
    product_id INT,
    color ENUM('Red', 'Blue', 'Green', 'Black', 'White'),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Users Table
CREATE TABLE Users (
    USER_id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

ALTER TABLE Users
CHANGE COLUMN USER_id user_id INT NOT NULL;

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE CartItems (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



