with 
    sales_reason as (
        select
            cast(salesreasonid as string) as sales_reason_id
            , name as reason_name
            , reasontype as reason_type
        from {{ source('stg_adventure_works','salesreason') }}
    )
select *
from sales_reason