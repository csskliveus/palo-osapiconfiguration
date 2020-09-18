resource "panos_nat_rule" "example" {
    for_each                = var.security_nat_rules
    name                    = each.key
    source_zones            = each.source_zones
    destination_zone        = each.destination_zone
    to_interface            = each.to_interface
    source_addresses        = each.source_addresses
    destination_addresses   = each.destination_addresses
    sat_type                = each.sat_type
    sat_address_type        = each.sat_address_type
    sat_interface           = each.sat_interface
    dat_type                = each.dat_type
    
}