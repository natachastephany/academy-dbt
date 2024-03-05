with
    dim_credit_card as (
        select
            {{ dbt_utils.surrogate_key(['credit_card_id']) }} as credit_card_sk
            , credit_card_id
            , card_type
        from {{ ref('stg_credit_card') }}
    )
select *
from dim_credit_card