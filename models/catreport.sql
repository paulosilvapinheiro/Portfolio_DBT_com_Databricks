{{
    config(
        materialized = 'incremental',
        unique_key = 'categoryId'
    )

}}

select * from {{source("sources","categories")}}