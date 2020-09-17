resource "panos_address_object" "this" {
  for_each = var.address_list
    name           = each.key //"localnet"
    value          = lookup(each.value, "address_value") //var.address_value //"192.168.80.0/24"
    description    = lookup(each.value, "address_description") //"The 192.168.80 network"
    type           = lookup(each.value, "add_obj_type") //var.add_obj_type
  //  tags = var.tags //"["+"internal", "dmz"]
}