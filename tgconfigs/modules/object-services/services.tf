resource "panos_service_object" "services" {
    for_each = var.service_list
    name = each.key
    #vsys = "vsys1" // optional. defaults to vsys1
    protocol = lookup(each.value, "protocol") 
    description = each.key
    #source_port = lookup(each.value, "source_port") 
    destination_port = lookup(each.value, "destination_port") 
    //tags = ["internal", "dmz"]
}