SELECT
  o.Order_ID,
  c.Customer_ID,
  c.Customer_Name,
  p.Product_ID,
  p.Product_Name,
  o.Quantity,
  {{get_date_parts('Order_Date')}} as date_extract

FROM demo_store_dataset.Orders o
  JOIN {{ref('stg_customers')}} c ON o.Customer_ID = c.Customer_ID
  JOIN demo_store_dataset.Products p ON o.Product_ID = p.Product_ID