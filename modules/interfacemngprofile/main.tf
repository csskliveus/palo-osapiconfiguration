resource "panos_management_profile" "panos-mng-profile1" {
    name = "allow ping"
    ping = true
}