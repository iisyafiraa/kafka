CREATE STREAM product_sales_stream (
    transaction_id VARCHAR,
    sale_date BIGINT,
    product VARCHAR,
    category VARCHAR,
    unit_price DOUBLE,
    units_sold INT,
    total_sales DOUBLE,
    ts BIGINT
) WITH (
    KAFKA_TOPIC='test-topic',
    VALUE_FORMAT='JSON'
);