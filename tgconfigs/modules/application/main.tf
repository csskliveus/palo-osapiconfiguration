resource "panos_application_object" "example" {
    name = "qa-app"
    description = "made by terraform"
    category = "media"
    subcategory = "gaming"
    technology = "browser-based"
    defaults {
        port {
            ports = [
                "udp/dynamic",
            ]
        }
    }
    risk = 4
    scanning {
        viruses = true
    }
}
resource "panos_application_group" "example" {
    name = "myApp"
    applications = [
        "qa-app",
    ]
}