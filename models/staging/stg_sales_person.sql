with 
    sales_person as (
        select
            cast(businessentityid as string) as businessentityid
            , cast(territoryid as int) as territoryid
            , cast(salesquota as int) as salesquota
            , cast(bonus as int) as bonus
            , commissionpct as commissionpct
            , salesytd as salesytd
            , saleslastyear as saleslastyear
        from {{source('stg_adventure_works', 'salesperson')}}
    )
select *
from sales_person