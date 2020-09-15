resource "panos_zone" "zone1" {
    name   = "myzone"
    mode   = "layer3"
}

resource "panos_zone" "appzone" {
    name   = "appzone"
    mode   = "layer3"
}


resource "panos_zone" "dbzone" {
    name   = "dbzone"
    mode   = "layer3"
}