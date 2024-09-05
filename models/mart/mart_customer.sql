{{
    config(
        tags=['mart']
    )
}}

with
 
customer_region AS (
    SELECT
    *
    FROM
    {{ref("stg_customer")}}
    where stg_customer.region NOT IN ('NUNAVUT')
),

customer_market AS (
    SELECT 
    * 
    FROM 
    customer_region
    left join {{ref("stg_market")}}
    on customer_region.CUST_ID=stg_market.CUST_ID
),

customer_order AS (
    SELECT
        cm.customer_name
        ,cm.region
        ,cm.customer_segment
        ,min(o.order_date) as first_order_date
        ,max(o.order_date) as most_recent_order_date
        ,count(o.order_id) as number_of_orders
    FROM
    customer_market as cm 
    left join {{ref("stg_orders")}} as o
    on customer_market.ORD_ID=stg_orders.ORD_ID
)

SELECT * FROM customer_order

