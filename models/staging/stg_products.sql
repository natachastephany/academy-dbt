with
    products as (
        select
            cast(productid as string) as product_id
            , name as product_name
        from {{source('stg_adventure_works', 'product')}}
    )
select *
from products