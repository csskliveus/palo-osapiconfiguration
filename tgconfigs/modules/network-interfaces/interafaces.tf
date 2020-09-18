# -----------------------------------------------
# creating interfaces for the palo-alto service
# referrence https://github.com/PaloAltoNetworks/terraform-templates/blob/master/panos_provider_sample_with_interface_config/fw_config.tf

# -----------------------------------------------

resource "panos_management_profile" "HealthProbe" {
    name            = var.management_profile_name
    ping            = true
    ssh             = true
    permitted_ips   = var.management_profile_permitted_ips
}

resource "panos_ethernet_interface" "ethernet_1_1" {
  name                      = "ethernet1/1"
  mode                      = "layer3"
  vsys                      = "vsys1"
  enable_dhcp               = true
  create_dhcp_default_route = true
  management_profile        = panos_management_profile.HealthProbe.name
}

resource "panos_ethernet_interface" "ethernet_1_2" {
  name                      = "ethernet1/2"
  mode                      = "layer3"
  vsys                      = "vsys1"
  enable_dhcp               = true
  create_dhcp_default_route = false
  management_profile        = panos_management_profile.HealthProbe.name
}

resource "panos_virtual_router" "public_vr" {
  name       = "public"
  interfaces = ["ethernet1/1"]
  #depends_on = [panos_ethernet_interface.ethernet_1_1]
}

resource "panos_virtual_router" "private_vr" {
  name       = "private"
  interfaces = ["ethernet1/2"]
  #depends_on = [panos_ethernet_interface.ethernet_1_2]
}

resource "panos_virtual_router_entry" "router_entry_ethernet_1_1" {
    virtual_router = panos_virtual_router.public_vr.name
    interface = panos_ethernet_interface.ethernet_1_1.name
}

resource "panos_virtual_router_entry" "router_entry_ethernet_1_2" {
    virtual_router = panos_virtual_router.private_vr.name
    interface = panos_ethernet_interface.ethernet_1_2.name
}

resource "panos_static_route_ipv4" "public_vr_static_route" {
    for_each        = var.public_routes
    name            = each.key
    virtual_router  = panos_virtual_router.public_vr.name
    destination     = lookup(each.value, "route_destination") 
    next_hop        = lookup(each.value,"route_nexthop")
    interface       = lookup(each.value,"route_interface")
    type            = lookup(each.value,"route_nexthoptype")
}

resource "panos_static_route_ipv4" "private_vr_static_route" {
    for_each         = var.private_routes
    name            = each.key
    virtual_router  = panos_virtual_router.private_vr.name
    destination     = lookup(each.value, "route_destination") 
    next_hop        = lookup(each.value,"route_nexthop")
    interface       = lookup(each.value,"route_interface")
    type            = lookup(each.value,"route_nexthoptype")
}

# resource "panos_static_route_ipv4" "example" {
#     name = "localnet"
#     virtual_router = "${panos_virtual_router.vr1.name}"
#     destination = "10.1.7.0/32"
#     next_hop = "10.1.7.4"
# }

resource "panos_zone" "public_untrust" {
  name       = "untrust"
  mode       = "layer3"
  interfaces = [panos_ethernet_interface.ethernet_1_1.name]
}

resource "panos_zone" "private_trust" {
  name       = "trust"
  mode       = "layer3"
  interfaces = [panos_ethernet_interface.ethernet_1_2.name]
}