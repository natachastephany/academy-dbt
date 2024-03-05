with 
    sales_territory as (
        select
            cast(territoryid as int) as territoryid
            , cast(name as string) as territory_name
            , cast(countryregioncode as string) as countryregioncode
            , cast(`group` as string) as territory_group
        from {{source('stg_adventure_works', 'salesterritory')}}
    )
select *
from sales_territory