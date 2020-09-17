terraform {
    source = "../../modules/network-interfaces"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    security_nat_rules = {
        "inbound-NAT" = {
            type                    = "ipv4"
            source_zones            = ["untrust"]
            destination_zone        = "trust"
            to_interface            = "any"
            service                 = "any"
            source_addresses        = ["AppGW-subnet"]
            destination_addresses   = ["any"]
            sat_type                = "dynamic-ip-and-port"
            sat_address_type        = "interface-address"
            sat_interface           = "ethernet1/2"
            dat_type                = "None"
        }
         "Outbound-NAT" = {
            type                    = "ipv4"
            source_zones            = ["trust"]
            destination_zone        = "untrust"
            to_interface            = "any"
            service                 = "any"
            source_addresses        = ["devops-agents-sub_10.120.4.0_24","func-cosmos-10.179.0.0_16","net-applications-10.123.0.0_20","net-applications-10.126.0.0_20","net-func-10.178.0.0_16"]
            destination_addresses   = ["any"]
            sat_type                = "dynamic-ip-and-port"
            sat_address_type        = "interface-address"
            sat_interface           = "ethernet1/1"
            dat_type                = "None"
        }
}