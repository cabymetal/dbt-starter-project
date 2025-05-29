with payments as (
    select * from {{ ref("stg_stripe__payments") }}
)
select order_id,
    sum(amount) as total_payments

from payments
group by order_id
having total_payments < 0
