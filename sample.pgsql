CREATE TABLE IF NOT EXISTS users (
    ID SERIAL PRIMARY KEY,
    email VARCHAR(50),      
    password TEXT,
    firstName VARCHAR(50),
    lastName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price numeric NOT NULL,
    description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    total INT  NOT NULL,
    status VARCHAR(50) NOT NULL,
    userId INT NOT NULL,
    created DATE NOT NULL,
    modified DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS orderItems (
    id SERIAL PRIMARY KEY,
    created DATE NOT NULL,
    orderId INT NOT NULL,
    quanity INT NOT NULL,
    price INT NOT NULL,
    productId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES orders(id)
);

CREATE TABLE IF NOT EXISTS carts (
    id SERIAL PRIMARY KEY,
    userId INT NOT NULL,
    modified DATE NOT NULL,
    created DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS cartItems (
    id SERIAL PRIMARY KEY,
    cartId INT NOT NULL,
    productId INT NOT NULL,
    quanity INT NOT NULL,
    FOREIGN KEY (cartId) REFERENCES carts(id),
    FOREIGN KEY (productId) REFERENCES products(id)
);