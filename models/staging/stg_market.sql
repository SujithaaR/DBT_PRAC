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

    {{ source('STORE', 'market') }}
),

datatype_conversion AS (

    SELECT

    CAST(SALES as float) as SALES
    ,CAST(DISCOUNT as float) as DISCOUNT
    ,CAST(ORDER_QUANTITY as Integer) as ORDER_QUANTITY
    ,CAST(PROFIT as float) as PROFIT
    ,CAST(SHIPPING_COST as float) as SHIPPING
    ,CAST(PRODUCT_BASE_MARGIN as float) as PRODUCT_BASE_MARGIN
    ,ORD_ID
    ,SHIP_ID
    ,PROD_ID
    ,CUST_ID
    
    FROM

    required_fields
)

SELECT * FROM datatype_conversion