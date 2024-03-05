with 
    products as (
        select
            {{ dbt_utils.surrogate_key(['product_id']) }} as product_sk
            , product_id
            , product_name
            , average_ticket
        from {{ref('int_average_ticket')}}
    )

select * from products