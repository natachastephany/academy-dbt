with
    final as (
        select
            {{ dbt_utils.surrogate_key(['sales_order_id', 'sales_reason_id']) }} as sales_reason_sk
            , sales_order_id
            , sales_reason_id
            , reason_name
            , reason_type
            , total_due
        from {{ref('int_sales_reason')}}
    )
select *
from final