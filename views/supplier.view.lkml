# The name of this view in Looker is "Supplier"
view: supplier {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `green_supplier.supplier`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Co2 Emission" in Explore.

  dimension: co2_emission {
    type: string
    sql: ${TABLE}.co2_emission ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: place {
    type: string
    sql: ${TABLE}.place ;;
  }

  dimension: reprisk_company_id {
    type: string
    sql: ${TABLE}.reprisk_company_id ;;
  }

  dimension: rri {
    type: number
    sql: ${TABLE}.RRI ;;
  }

  dimension: rrr {
    type: string
    sql: ${TABLE}.RRR ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }

  dimension: total_landed_cost {
    type: number
    sql: ${TABLE}.total_landed_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_landed_cost {
    type: sum
    sql: ${total_landed_cost} ;;
  }

  measure: average_total_landed_cost {
    type: average
    sql: ${total_landed_cost} ;;
  }

  measure: count {
    type: count
    drill_fields: [supplier_name]
  }
}
