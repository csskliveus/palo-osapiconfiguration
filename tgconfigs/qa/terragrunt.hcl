remote_state {
  backend = "azurerm"

  generate = {
    path      = "main.tf"
    if_exists = "overwrite_terragrunt"
}

  config    = {
      key   = "${path_relative_to_include()}/terraform.tfstate"  # with this, tf state folder structure resembles terragrunt folder structure.
      resource_group_name  = "uw"
      storage_account_name = "terraformstate1"
      container_name       =  "palo-alto"
  }
   
} 

# This section is generating provider file from the text file given

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = file("./provider.txt")
}




inputs = merge (
  # load environment value from this file
  /*yamldecode(
    file("./env.yml")
  ), */
  # load common variables for this environment like tag
  yamldecode(
    file("./common_variables.yml")
  )
)
