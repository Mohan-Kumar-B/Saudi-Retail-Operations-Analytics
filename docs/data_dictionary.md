# Data Dictionary

## fact_sales
- order_id: unique transaction identifier
- order_date: transaction date
- customer_id: customer key
- product_id: product key
- store_id: store key
- quantity: units sold
- discount: discount rate
- payment_method: payment channel
- revenue: net sales after discount
- cost_amount: product cost for the transaction
- profit: revenue minus cost

## dim_customer
Customer demographic and segment information.

## dim_product
Product, category, brand and pricing information.

## dim_store
Store, city, region and store type information.
