with 
    employee as (
        select
            cast(businessentityid as string) as businessentityid
            , cast(jobtitle as string) as jobtitle
            , cast(hiredate as date) as hiredate
        from {{source('stg_adventure_works', 'employee')}}
    )
select *
from employee