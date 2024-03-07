with 
    sales_order_header as (
        select
            {{ dbt_utils.surrogate_key(['sales_order_id']) }} as sales_order_sk
            , sales_order_id
            , order_date
            , status
            , customer_id
            , sales_person_id
            , territory_id 
            , credit_card_id
            , total_due
        from {{ref('stg_sales_order_header')}}
    )
select *
from sales_order_header