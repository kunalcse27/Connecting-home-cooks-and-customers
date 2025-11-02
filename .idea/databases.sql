CREATE DATABASE connecting_home_cooks;
USE connecting_home_cooks;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  role ENUM('cook', 'customer') NOT NULL,
  phone VARCHAR(15),
  address VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dishes (
  dish_id INT AUTO_INCREMENT PRIMARY KEY,
  cook_id INT,
  dish_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  description TEXT,
  available BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (cook_id) REFERENCES users(user_id)
);

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  cook_id INT,
  dish_id INT,
  quantity INT DEFAULT 1,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status ENUM('pending', 'accepted', 'completed', 'cancelled') DEFAULT 'pending',
  FOREIGN KEY (customer_id) REFERENCES users(user_id),
  FOREIGN KEY (cook_id) REFERENCES users(user_id),
  FOREIGN KEY (dish_id) REFERENCES dishes(dish_id)
);