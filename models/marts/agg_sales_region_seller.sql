WITH sales_by_region_seller AS (
    SELECT
        s.territory_name,
        s.full_name,
        COUNT(o.sales_order_id) AS total_orders,
        SUM(o.unit_price * o.order_qty) AS total_sales_value
    FROM {{ ref('fct_order_detail') }} o
    JOIN {{ ref('dim_employee') }} s ON o.seller_id = s.seller_id
    GROUP BY s.territory_name, s.full_name
)

SELECT
    territory_name,
    full_name,
    total_orders,
    total_sales_value
FROM sales_by_region_seller