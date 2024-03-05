with
    sales_order_detail as (
        select
            cast(salesorderdetailid as string) as sales_order_detail_id
            , cast(salesorderid as string) as sales_order_id
            , orderqty as order_qty
            , cast(productid as string) product_id
            , unitprice as unit_price
        from {{ source('stg_adventure_works','salesorderdetail') }}
    )
select *
from sales_order_detail