resource "panos_security_policy" "example" {
    rule {
        name = "allow bizdev to dmz"
        source_zones = ["bizdev"]   // created in UI
        source_addresses = ["any"]
        source_users = ["any"]
        hip_profiles = ["any"]
        destination_zones = ["dmz"]   // created in UI
        destination_addresses = ["any"]
        applications = ["any"]
        services = ["application-default"]  // created in UI
        categories = ["any"]
        action = "allow"
    }
    rule {
        name = "deny sales to eng"
        source_zones = ["sales"]   // created in UI
        source_addresses = ["any"]
        source_users = ["any"]
        hip_profiles = ["any"]
        destination_zones = ["eng"]  // created in UI
        destination_addresses = ["any"]
        applications = ["any"]
        services = ["application-default"] // created in UI
        categories = ["any"]
        action = "deny"
    }
}