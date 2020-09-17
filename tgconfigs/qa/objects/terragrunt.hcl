terraform {
    source = "../../modules/addressobject"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  address_list = {
    APIM-FQDN = {
      address_name           = "APIM-FQDN"
      address_value          = "apimstg.vca-nonprdn-westus2.private"
      address_description    = "APIM-FQDN"
      add_obj_type           = "fqdn"
    },
    APIM-private-IP = {
      address_name           = "APIM-private-IP"
      address_value          = "10.123.4.5/32"
      address_description    = "APIM-private-IP"
      add_obj_type           = "ip-netmask"
    },
      AppGW-subnet = {
      address_name           = "AppGW-subnet"
      address_value          = "10.120.0.0/25"
      address_description    = "AppGW-subnet"
      add_obj_type           = "ip-netmask"
    },
    Azure-probe  = {
      address_name           = "Azure-probe"
      address_value          = "168.63.129.16/32"
      address_description    = "Azure-probe"
      add_obj_type           = "ip-netmask"
    },
    "devops-agents-sub_10.120.4.0_24"  = {
      address_name           = "devops-agents-sub_10.120.4.0_24"
      address_value          = "10.120.4.0/24"
      address_description    = "devops-agents"
      add_obj_type           = "ip-netmask"
    },
    "net-applications-10.123.0.0_20" = {
      address_name           = "net-applications-10.123.0.0_20"
      address_value          = "10.123.0.0/20"
      address_description    = "net-applications-10.123.0.0_20"
      add_obj_type           = "ip-netmask"
    },
    "net-applications-10.126.0.0_20" = {
      address_name           = "net-applications-10.126.0.0_20"
      address_value          = "10.126.0.0/20"
      address_description    = "net-applications-10.126.0.0_20"
      add_obj_type           = "ip-netmask"
    },
    STGINGRESS-FQDN = {
      address_name           = "STGINGRESS-FQDN"
      address_value          = "stgingress.vca-nonprdn-westus2.private"
      address_description    = "STGINGRESS-FQDN"
      add_obj_type           = "fqdn"
    },
    voyagerapp-appservice-public = {
      address_name           = "voyagerapp-appservice-public"
      address_value          = "voyagerapp.azurewebsites.net"
      address_description    = "voyagerapp-appservice-public"
      add_obj_type           = "fqdn"
    }
  }
}