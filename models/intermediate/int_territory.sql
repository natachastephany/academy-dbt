with
    customer as (
        select
            customer_id
            , person_id
        from {{ref('stg_customer')}}
        where person_id is not null
    )
    , filter_customer as (
        select distinct
            customer_id
            , person_id
        from customer
    )
    , business_entity_address_id as (
        select
            business_entity_id
            , address_id
        from {{ref('stg_business_entity_address')}}
    )
    , business_address as (
        select
            address_id
            , city
            , state_province_id       
        from {{ref('stg_address')}}     
    )
    , state_province as (
        select 
            state_province_id
            , country_region_code
            , province_name
        from {{ref('stg_state_province')}}
    )
    , country_region as (
        select
            country_region_code
            , country_region_name
        from {{ref('stg_country_region')}}
    )
    , join_address_id as (
        select
            filter_customer.customer_id
            , filter_customer.person_id
            , business_entity_address_id.address_id
        from filter_customer
        left join business_entity_address_id
            on business_entity_address_id.business_entity_id = filter_customer.person_id
    )
    , join_address_name as (
        select 
            join_address_id.customer_id
            , join_address_id.person_id
            , join_address_id.address_id
            , business_address.city
            , business_address.state_province_id     
        from join_address_id
        left join business_address
            on business_address.address_id = join_address_id.address_id
    )
    , join_state_province as (
        select
            join_address_name.customer_id
            , join_address_name.person_id
            , join_address_name.address_id
            , join_address_name.city
            , join_address_name.state_province_id
            , state_province.country_region_code
            , state_province.province_name
        from join_address_name
        left join state_province
            on state_province.state_province_id = join_address_name.state_province_id
    )
    , final as (
        select
            join_state_province.customer_id
            , join_state_province.person_id
            , join_state_province.address_id
            , join_state_province.city
            , join_state_province.state_province_id
            , join_state_province.country_region_code
            , join_state_province.province_name 
            , country_region.country_region_name
        from join_state_province
        left join country_region
            on country_region.country_region_code = join_state_province.country_region_code
    )
select *
from final