with
    order_header as (
        select
            sales_order_id
            , sales_person_id
            , order_date
            , customer_id
            , territory_id 
            , credit_card_id
            , total_due
            , status
        from {{ref('stg_sales_order_header')}}
    )
    , dim_customer as (
        select
            customer_sk
            , customer_id
        from {{ref('dim_customer')}}
    )
    , dim_territory as (
        select
            territory_sk
            , customer_id
            , full_address
        from {{ref('dim_territory')}}
    )
    , dim_credit_card as (
        select
            credit_card_sk
            , credit_card_id
        from {{ref('dim_credit_card')}}
    )
    , join_data as (
        select
            dim_customer.customer_sk as customer_fk
            , dim_territory.territory_sk as territory_fk
            , dim_credit_card.credit_card_sk as credit_card_fk
            , order_header.sales_person_id
            , order_header.sales_order_id
            , order_header.order_date
            , order_header.customer_id
            , order_header.credit_card_id
            , order_header.total_due
            , order_header.status
            , order_header.territory_id
            , dim_territory.full_address
        from order_header
        left join dim_customer
            on dim_customer.customer_id = order_header.customer_id
        left join dim_territory
            on dim_territory.customer_id = order_header.customer_id
        left join dim_credit_card
            on dim_credit_card.credit_card_id = order_header.credit_card_id
    )

select *
from join_data