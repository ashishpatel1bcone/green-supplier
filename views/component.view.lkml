# The name of this view in Looker is "Component"
include: "/views/supplier.view"
view: component {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `green_supplier.component`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Component Name" in Explore.

  dimension: component_name {
    type: string
    sql: ${TABLE}.component_name ;;
    drill_fields: [material_supplier*]
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, component_name, product.product_id, product.name, material.count]
  }

  #ashish
  set: material_supplier {
    fields: [
      component_name,
      supplier.material,
      supplier.co2_emission,
      supplier.rrr,
      supplier.rri,
      product_id
      ]
  }
}
