object @payment

node(:uri) { |payment| user_order_payment_url payment.order.user, payment.order }