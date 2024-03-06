with
    order_details as (
        select sales_order_detail_id, sales_order_id, product_id, order_qty, unit_price
        from {{ ref("stg_sales_order_detail") }}
    ),
    dim_sales_order_header as (
        select
            sales_order_sk,
            sales_person_id,
            sales_order_id,
            order_date,
            customer_id,
            territory_id
        from {{ ref("dim_sales_order_header") }}
    ),
    dim_products as (select product_sk, product_id from {{ ref("dim_products") }}),
    dim_territory as (
        select territory_sk, customer_id, full_address from {{ ref("dim_territory") }}
    ),
    join_data as (
        select
            dim_sales_order_header.sales_order_sk as sales_order_fk,
            dim_sales_order_header.sales_person_id as seller_id,
            dim_products.product_sk as product_fk,
            order_details.sales_order_detail_id,
            order_details.sales_order_id,
            order_details.product_id,
            order_details.order_qty,
            order_details.unit_price,
            (order_details.order_qty * order_details.unit_price) as sub_total,
            dim_sales_order_header.order_date,
            dim_sales_order_header.customer_id,
            dim_sales_order_header.territory_id
        from order_details
        left join
            dim_sales_order_header
            on dim_sales_order_header.sales_order_id = order_details.sales_order_id
        left join dim_products on dim_products.product_id = order_details.product_id
    ),
    final as (
        select
            dim_territory.territory_sk as territory_fk,
            join_data.seller_id,
            join_data.sales_order_fk,
            join_data.product_fk,
            join_data.sales_order_detail_id,
            join_data.sales_order_id,
            join_data.product_id,
            join_data.order_qty,
            join_data.unit_price,
            join_data.sub_total,
            join_data.order_date,
            join_data.customer_id,
            join_data.territory_id,
            dim_territory.full_address
        from join_data
        left join dim_territory on dim_territory.customer_id = join_data.customer_id
    )
select *
from final