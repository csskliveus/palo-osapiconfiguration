terraform {
    source = "../../modules/network-interfaces"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  management_profile_name = "HealthProbe"
  management_profile_permitted_ips = ["168.63.129.16/32"]
  private_routes = {
    "default" ={
      route_destination     = "0.0.0.0/0"
      route_interface       = ""
      route_nexthoptype     = "next-vr"
      route_nexthop         = "public"
    },
    "Health-probe" = {
      route_destination     = "Azure-probe"
      route_interface       = "ethernet1/2"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.2.1"
    },
    "apps" = {
      route_destination     = "net-applications-10.123.0.0_20"
      route_interface       = "ethernet1/2"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.2.1"
    },
    "agents" = {
      route_destination     = "devops-agents-sub_10.120.4.0_24"
      route_interface       = "ethernet1/2"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.2.1"
    },
    "trust" = {
      route_destination     = "10.120.2.0/24"
      route_interface       = "ethernet1/2"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.2.1"
    },
    "apps2" = {
      route_destination     = "net-applications-10.126.0.0_20"
      route_interface       = "ethernet1/2"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.2.1"
    }
  }
  public_routes = {
    "inet" ={
      route_destination     = "0.0.0.0/0"
      route_interface       = "ethernet1/1"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.1.1"
    },
    "probe" = {
      route_destination     = "Azure-probe"
      route_interface       = "ethernet1/1"
      route_nexthoptype     = "ip-address"
      route_nexthop         = "10.120.1.1"
    },
    "apps" = {
      route_destination     = "net-applications-10.123.0.0_20"
      route_interface       = ""
      route_nexthoptype     = "next-vr"
      route_nexthop         = "private"
    },
    "agents" = {
      route_destination     = "devops-agents-sub_10.120.4.0_24"
      route_interface       = ""
      route_nexthoptype     = "next-vr"
      route_nexthop         = "private"
    },
    "trust" = {
      route_destination     = "10.120.2.0/24"
      route_interface       = ""
      route_nexthoptype     = "next-vr"
      route_nexthop         = "private"
    },
    "apps2" = {
      route_destination     = "net-applications-10.126.0.0_20"
      route_interface       = ""
      route_nexthoptype     = "next-vr"
      route_nexthop         = "private"
    }
  }
}