-- drop db if exists
DROP DATABASE IF EXISTS ecomm_db;

-- create a new db
CREATE DATABASE ecomm_db;

-- use the current db
USE ecomm_db;

-- create users table
CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT,
    item_name VARCHAR(255) NOT NULL,
    item_image text NULL,
    item_quantity INT NULL,
    item_color VARCHAR(255) NULL,
    item_size INT NULL,
    item_cost VARCHAR(255) NULL,
    PRIMARY KEY (id)
);
CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE user_address(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NULL,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    -- IS 0 TRUE OR FALSE?
    shipping_address BOOLEAN DEFAULT 0,
    billing_address BOOLEAN DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE payment_info(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    card_type VARCHAR(255) NOT NULL,
    card_no VARCHAR(20) NOT NULL,
    security_code INT(3) NOT NULL,
    card_expiry_month INT(2) NOT NULL,
    card_expiry_year INT(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE purchase_items(
    id INT NOT NULL AUTO_INCREMENT,
    purchase_item_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_item_id) REFERENCES items(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    purchases_id INT NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    total_shipping_cost DECIMAL(10,2) NOT NULL,
    total_tax DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (purchases_id) REFERENCES purchase_items(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);