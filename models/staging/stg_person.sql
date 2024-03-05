with
    person as (
        select
            cast(businessentityid as string) as business_entity_id
            , persontype
            , firstname as first_name
            , middlename as middle_name
            , lastname as last_name
        from {{source('stg_adventure_works','person')}}
    )
select *
from person