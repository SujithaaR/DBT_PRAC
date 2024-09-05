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
    {{ source('STORE', 'product') }}
),

datatype_conversion AS (

    SELECT
    *
    FROM

    required_fields
)

SELECT * FROM datatype_conversion