with
    order_details as (
        select
            sales_order_detail_id
            , sales_order_id
            , product_id
            , order_qty
            , unit_price
        from {{ref('stg_sales_order_detail')}}
    )
    , products as (
        select
            product_id
            , product_name
        from {{ref('stg_products')}}
    )
    , join_data as (
        select
            order_details.sales_order_detail_id
            , order_details.sales_order_id
            , order_details.product_id
            , order_details.order_qty
            , order_details.unit_price
            , (order_details.order_qty*order_details.unit_price) as sub_total
            , products.product_name
        from order_details
        left join products
            on products.product_id = order_details.product_id          
    )
    , average_ticket as (
        select
            join_data.product_id
            , (sum(join_data.sub_total) / sum(join_data.order_qty)) as average_ticket
            , product_name
        from join_data
        group by product_id, product_name
    )

select *
from average_ticket