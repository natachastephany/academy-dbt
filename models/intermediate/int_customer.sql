with
    customer as (
        select
            customer_id
            , person_id
            , store_id
        from {{ref('stg_customer')}}
    )
    , customer_name as (
        select
            business_entity_id
            , persontype
            , first_name
            , middle_name
            , last_name
        from {{ref('stg_person')}}
    )
    , join_data as (
        select
            customer.customer_id
            , customer.person_id
            , customer.store_id
            , customer_name.business_entity_id
            , customer_name.persontype
            , customer_name.first_name
            , customer_name.middle_name
            , customer_name.last_name
        from customer
        left join customer_name
            on customer_name.business_entity_id = customer.person_id
    )
    , filter_null as (
        select *
        from join_data
        where person_id is not null
    )
    , full_name_column as (
        select 
            customer_id
            , person_id
            , store_id
            , business_entity_id
            , persontype
            , first_name
            , middle_name
            , last_name
            , case
                when middle_name is null then concat(first_name, ' ', last_name)
                else concat(first_name, ' ', middle_name, ' ', last_name)
            end as full_name
        from filter_null
    )
select *
from full_name_column