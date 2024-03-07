with
    sales_reason as (
        select
            sales_reason_sk    
            , sales_order_id
            , sales_reason_id
            , reason_name
            , reason_type
        from {{ref('dim_sales_reason')}}
    )
    , sales_order_qty as (
        select
            sales_order_id
            , sum(order_qty) as order_qty
            , sum(unit_price) as sum_price
        from {{ref('stg_sales_order_detail')}}
        group by sales_order_id
    )
    , join_data as (
        select
            sales_reason.sales_reason_sk as sales_reason_fk
            , sales_reason.sales_order_id
            , sales_reason.sales_reason_id
            , sales_reason.reason_name
            , sales_reason.reason_type
            , sales_order_qty.order_qty
            , sales_order_qty.sum_price            
        from sales_reason
        left join sales_order_qty
            on sales_order_qty.sales_order_id = sales_reason.sales_order_id
    )
select *
from join_data