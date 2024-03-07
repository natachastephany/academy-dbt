with
    final as (
        select
            {{ dbt_utils.surrogate_key(['customer_id']) }} as customer_sk
            , customer_id
            , person_id
            , persontype
            , first_name
            , middle_name
            , last_name
            , full_name
            , store_id
        from {{ ref('int_customer') }}
    )
select *
from final