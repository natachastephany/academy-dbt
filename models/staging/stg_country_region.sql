with
    country_region as (
        select
            countryregioncode as country_region_code
            , name as country_region_name
        from {{source('stg_adventure_works','countryregion')}}
    )
select *
from country_region