terraform {
    source = "../../modules/services"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  service_list = {
    "apim-service-dependencies" = {
      destination_port       = "443,1433,5671,5672,445,1886,25,587,25028,6381-6383,4290,12000"
      source_port            = ""
      protocol               = "tcp"
    },
    service-aks = {
      destination_port       = "9000,12000,10250,3342,1886,3443,443,80,8080,14000-16000,11000-11200,15020,1194,9000-9500"
      source_port            = ""
      protocol               = "tcp"
    },
    service-aks-udp = {
      destination_port       = "1194,123"
      source_port            = ""
      protocol               = "udp"
    },
    service-http8081  = {
      destination_port       = "8081"
      source_port            = ""
      protocol               = "tcp"
    },
    service-http8881  = {
      destination_port       = "8881"
      source_port            = ""
      protocol               = "tcp"
    },
    "service-http8882" = {
      destination_port       = "8882"
      source_port            = ""
      protocol               = "tcp"
    }
  }
}