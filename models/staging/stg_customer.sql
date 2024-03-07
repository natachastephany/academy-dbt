with
    customer as (
        select
            cast(customerid as string) as customer_id
            , cast(personid as string) as person_id
            , cast(storeid as string) as store_id
        from {{ source('stg_adventure_works', 'customer') }}
    )
select *
from customer