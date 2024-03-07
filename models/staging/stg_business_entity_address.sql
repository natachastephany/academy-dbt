with 
    business_address as (
        select
            cast(businessentityid as string) as business_entity_id
            , cast(addressid as string) as address_id
            , cast(addresstypeid as string) as address_type_id
        from {{source('stg_adventure_works', 'businessentityaddress')}}
        where addresstypeid = 2
    )
select *
from business_address