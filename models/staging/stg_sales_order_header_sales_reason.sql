with 
    sales_order_header_sales_reason as (
        select 
            cast(salesorderid as string) as sales_order_id
            , cast(salesreasonid as string) as sales_reason_id
        from {{ source('stg_adventure_works','salesorderheadersalesreason') }}
    )
select *
from sales_order_header_sales_reason