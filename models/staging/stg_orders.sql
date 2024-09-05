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

    {{ source('STORE', 'orders') }}
),

datatype_conversion AS (

    SELECT

    CAST(ORDER_DATE as DATE) as ORDER_DATE
    ,ORDER_ID
    ,ORDER_PRIORITY
    ,ORD_ID
    
    FROM

    required_fields
)

SELECT * FROM datatype_conversion