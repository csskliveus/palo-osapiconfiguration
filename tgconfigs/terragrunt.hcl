/*
remote_state {
  backend = "azurerm"

  generate = {
    path      = "main.tf"
    if_exists = "overwrite_terragrunt"
}

  config    = {
      key   = "${path_relative_to_include()}/terraform.tfstate"  # with this, tf state folder structure resembles terragrunt folder structure.
      resource_group_name  = "vca-qa-rg-uw"
      storage_account_name = "qaterraformstate1"
      container_name       =  "palo-alto"
  }
}

# This section is generating provider file from the text file given

generate "provider" {
    path      = "provider.tf"
    if_exists = "overwrite"
    contents  = file("${get_parent_terragrunt_dir()}/../provider.txt")
}



inputs = merge (
  # load environment value from this file
  yamldecode(
    file("${get_parent_terragrunt_dir()}/env.yaml")
  ),
  # load common variables for this environment like tag
  yamldecode(
    file("${get_parent_terragrunt_dir()}/common_variables.yaml")
  )
)
*/