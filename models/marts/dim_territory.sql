with
    final as (
        select
            {{ dbt_utils.surrogate_key(['customer_id']) }} as territory_sk
            , customer_id
            , person_id
            , address_id
            , city
            , state_province_id
            , country_region_code
            , province_name 
            , country_region_name
            , case 
                when address_id is null then 'Endereço não cadastrado'
                else concat(city, ', ',province_name, ', ', country_region_name)
            end as full_address
        from {{ref('int_territory')}}
    )
select *
from final