# Issues with argunments needs to be fixed
resource "panos_security_policy" "example" {

    for_each                = var.security_rules
    name                    = each.key
    type                    = lookup(each.value, "rule_type")
    source_zones            = lookup(each.value, "source_zones")  // created in UI
    source_addresses        = lookup(each.value,"source_address")
    source_users            = lookup(each.value,"source_users")
    destination_zones       = lookup(each.value,"destination_zones")// created in UI
    destination_addresses   = lookup(each.value,"destination_addresses")
    applications            = lookup(each.value,"applications")
    services                = lookup(each.value,"services")  // created in UI
    categories              = lookup(each.value,"categories") 
    action                  = lookup(each.value,"action")


}