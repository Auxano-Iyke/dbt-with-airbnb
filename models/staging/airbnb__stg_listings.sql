with source as (
    select *
    from
        {{ source('airbnb', 'listings') }}
)

, rename_columns as (
    select
        id as listing_id
        , listing_url
        , name as listing_name
        , room_type
        , minimum_nights
        , host_id
        , price as listing_price
        , created_at
        , updated_at
    from
        source
)

select * from rename_columns
