with source as (
    select *
    from
        {{ source('airbnb', 'hosts') }}
)

, rename_columns as (
    select
        id as host_id
        , name as host_name
        , case
            when is_superhost = 't' then 1
            else 0
        end as is_superhost
        , created_at
        , updated_at
    from
        source
)

select * from rename_columns
