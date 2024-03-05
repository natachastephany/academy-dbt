with
    credit_card as (
        select
            cast(creditcardid as string) as credit_card_id
            , cardtype as card_type
        from {{ source('stg_adventure_works','creditcard') }}
    )
select *
from credit_card