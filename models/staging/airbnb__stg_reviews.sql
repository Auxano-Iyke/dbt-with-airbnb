with source as (
    select *
    from
        {{ source('airbnb', 'reviews') }}
)

, rename_columns as (
    select
        md5(concat_ws('|', reviewer_name::text, date::text, listing_id::text)) as review_id
        , listing_id
        , date as review_date
        , reviewer_name
        , comments as review_comments
        , sentiment as review_sentiment
    from
        source
)

select * from rename_columns
