terraform {
    source = "../../modules/policies-security"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    security_rules = {
        "inbound" = {
            rule_type           = "universal"
            source_zones        = ["untrust"]   // created in UI
            source_addresses    = ["AppGW-subnet"]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["service-http,service-https"]  // created in UI
            categories          = ["any"]
            action              = "allow"

        },
        "app-to-db" = {
            type                = "intrazone"
            source_zones        = ["trust"]   // created in UI
            source_addresses    = ["net-applications-10.123.0.0_20"]
            source_users        = ["any"]
            destination_zones   = ["trust"]   // created in UI
            destination_addresses = ["net-applications-10.126.0.0_20"]
            applications        = ["any"]
            services            = ["service-aks"]  // created in UI
            categories          = ["any"]
            action              = "allow"

        },
        "app-to-db-func" = {
            type                = "universal"
            source_zones        = ["any"]   // created in UI
            source_addresses    = ["net-func-10.178.0.0_16 "]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["func-cosmos-10.179.0.0_16"]
            applications        = ["any"]
            services            = ["any"]  // created in UI
            categories          = ["any"]
            action              = "allow"
        },
        "agents-to-apps" = {
            type                = "intrazone"
            source_zones        = ["trust"]   // created in UI
            source_addresses    = ["devops-agents-sub_10.120.4.0_24"]
            source_users        = ["any"]
            destination_zones   = ["trust"]   // created in UI
            destination_addresses = ["net-applications-10.123.0.0_20"]
            applications        = ["any"]
            services            = ["application-default"]  // created in UI
            categories          = ["any"]
            action              = "allow"
        },
        "apps-to-agents" = {
            type                = "intrazone"
            source_zones        = ["trust"]   // created in UI
            source_addresses    = ["net-applications-10.123.0.0_20"]
            source_users        = ["any"]
            destination_zones   = ["trust"]   // created in UI
            destination_addresses = ["devops-agents-sub_10.120.4.0_24"]
            applications        = ["any"]
            services            = ["application-default"]  // created in UI
            categories          = ["any"]
            action              = "allow"
        },
        "apim-aks" = {
            type                = "universal"
            source_zones        = ["trust"]   // created in UI
            source_addresses    = ["net-applications-10.123.0.0_20"]
            source_users        = ["any"]
            destination_zones   = ["untrust"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["apim-service-dependencies","service-aks"]  // created in UI
            categories          = ["any"]
            action              = "allow"

        },
        "outbound" = {
            type                = "universal"
            source_zones        = ["trust","untrust"]   // created in UI
            source_addresses    = ["net-applications-10.123.0.0_20","devops-agents-sub_10.120.4.0_24","net-applications-10.126.0.0_20"]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["any"]  // created in UI
            categories          = ["any"]
            action              = "allow"

        },
        "allow_Azure-probe" = {
            type                = "universal"
            source_zones        = ["any"]   // created in UI
            source_addresses    = ["Azure-probe"]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["any"]  // created in UI
            categories          = ["any"]
            action              = "allow"

        },
        "deny_all" = {
            type                = "universal"
            source_zones        = ["any"]   // created in UI
            source_addresses    = ["any"]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["any"]  // created in UI
            categories          = ["any"]
            action              = "deny"

        }

        "deny_all" = {
            type                = "universal"
            source_zones        = ["any"]   // created in UI
            source_addresses    = ["any"]
            source_users        = ["any"]
            destination_zones   = ["any"]   // created in UI
            destination_addresses = ["any"]
            applications        = ["any"]
            services            = ["any"]  // created in UI
            categories          = ["any"]
            action              = "deny"

        }


    }
}