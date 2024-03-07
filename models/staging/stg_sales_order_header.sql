with 
    sales_order_header as (
        select 
            cast(salesorderid as string) as sales_order_id
            , orderdate as order_date
            , status
            , cast(customerid as string) as customer_id
            , cast(salespersonid as string) as sales_person_id
            , cast(territoryid as string) as territory_id 
            , cast(creditcardid as string) as credit_card_id
            , totaldue as total_due
        from {{ source('stg_adventure_works','salesorderheader') }}
    )
select *
from sales_order_header