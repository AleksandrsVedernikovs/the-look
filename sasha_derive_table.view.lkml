view: sasha_derive_table {
 derived_table: {
   sql: SELECT
     order_items.id  AS 'id',
     COALESCE(SUM(order_items.sale_price ), 0) AS 'total_sales'
    FROM demo_db.order_items ;;
 }
 dimension: id {
   primary_key: yes
   type: number
   sql: ${TABLE}.id ;;
 }

 dimension: total_sales {
   type: number
   sql: ${TABLE}.total_sales ;;
   value_format: "$0"
 }

measure: ave_sales {
  type: average
  sql: ${total_sales} ;;
  value_format: "$0"
}
}
