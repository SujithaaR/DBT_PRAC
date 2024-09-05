{{
    config(
        tags=['staging']
    )
}}

with 

required_fields AS (

    SELECT 
    *
    FROM

    {{ source('STORE', 'shipping') }}
),

datatype_conversion AS (

    SELECT

    CAST(SHIP_DATE as DATE) as SHIP_DATE
    , CAST(ORDER_ID as Integer) as ORDER_ID
    ,SHIP_MODE
    ,SHIP_ID
    
    FROM

    required_fields
)

SELECT * FROM datatype_conversion