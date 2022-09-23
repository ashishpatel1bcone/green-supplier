# Define the database connection to be used for this model.
connection: "looker-trial"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: green-supplier_default_datagroup {
  ## sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: green-supplier_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Green-supplier"

explore: component {
  join: product {
    type: left_outer
    sql_on: ${component.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }
}

explore: material {
  join: component {
    type: left_outer
    sql_on: ${material.component_id} = ${component.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${component.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: supplier {
  join: material {
    type: left_outer
    sql_on: ${supplier.material} = ${material.name} ;;
    relationship: many_to_one
  }
  join: component{
    type: left_outer
    sql_on: ${material.component_id} = ${component.id} ;;
    relationship: many_to_one
  }

 join: product{
    type: left_outer
    sql_on: ${component.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }
}

explore: product {}
