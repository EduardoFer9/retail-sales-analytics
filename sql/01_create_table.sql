-- DDL: Creación de la estructura de la tabla para GlobalMart
-- Este script define las 21 columnas originales y las 5 columnas derivadas [cite: 35, 37]

CREATE TABLE retail_sales (
    row_id          INTEGER,
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(30),
    customer_id     VARCHAR(10),
    customer_name   VARCHAR(50),
    segment         VARCHAR(20),
    country         VARCHAR(30),
    city            VARCHAR(50),
    state           VARCHAR(30),
    postal_code     VARCHAR(10),
    region          VARCHAR(20),
    product_id      VARCHAR(20),
    category        VARCHAR(25),
    sub_category    VARCHAR(25),
    product_name    VARCHAR(150),
    sales           NUMERIC(10,2),
    quantity        INTEGER,
    discount        NUMERIC(4,2),
    profit          NUMERIC(10,2),
    -- Columnas derivadas creadas en el Pipeline de Python [cite: 37]
    profit_margin   NUMERIC(6,4),
    order_year      INTEGER,
    order_month     INTEGER,
    shipping_days   INTEGER,
    is_loss         BOOLEAN
);

-- Validación de carga (Opcional)
-- SELECT COUNT(*) FROM retail_sales;