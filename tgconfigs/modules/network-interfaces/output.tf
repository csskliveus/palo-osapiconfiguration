output interface1{
    value = panos_ethernet_interface.ethernet_1_1
}

output interface2{
    value = panos_ethernet_interface.ethernet_1_2
}

output public_router{
    value = panos_virtual_router.public_vr
}

output private_router{
    value = panos_virtual_router.private_vr
}

output untrust_zone{
    value = panos_zone.public_untrust
}

output trust_zone{
    value = panos_zone.private_trust
}