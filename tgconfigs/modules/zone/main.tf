resource "panos_zone" "trust" {
    name = "trust"
    mode = "layer3"
    interfaces = ["ethernet1/2"]
    enable_user_id = true
}


resource "panos_zone" "untrust" {
    name = "untrust"
    mode = "layer3"
    interfaces = ["ethernet1/1"]
    enable_user_id = true
}

# resource "panos_zone" "zone1" {
#     name   = "myzone"
#     mode   = "layer3"
# }

# resource "panos_zone" "appzone" {
#     name   = "appzone"
#     mode   = "layer3"
# }


# resource "panos_zone" "dbzone" {
#     name   = "dbzone"
#     mode   = "layer3"
# }

