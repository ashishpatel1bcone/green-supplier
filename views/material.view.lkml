# The name of this view in Looker is "Material"
view: material {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `green_supplier.material`
    ;;
  drill_fields: [material_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: material_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.material_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Component ID" in Explore.

  dimension: component_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.component_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [material_id, name, component.component_name, component.id]
  }
}
