-- PostgreSQL / Redshift-compatible analytical schema
CREATE TABLE dim_customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    city VARCHAR(50),
    customer_type VARCHAR(30),
    registration_date DATE
);

CREATE TABLE dim_product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(80),
    subcategory VARCHAR(80),
    brand VARCHAR(80),
    cost DECIMAL(12,2),
    selling_price DECIMAL(12,2)
);

CREATE TABLE dim_store (
    store_id VARCHAR(20) PRIMARY KEY,
    store_name VARCHAR(120),
    city VARCHAR(50),
    region VARCHAR(50),
    store_type VARCHAR(50)
);

CREATE TABLE fact_sales (
    order_id VARCHAR(30) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    store_id VARCHAR(20),
    quantity INT,
    discount DECIMAL(6,4),
    payment_method VARCHAR(50),
    revenue DECIMAL(14,2),
    cost_amount DECIMAL(14,2),
    profit DECIMAL(14,2)
);
