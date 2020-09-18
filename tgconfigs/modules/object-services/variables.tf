variable service_list {
    description = "Service list"
    type  = map(any)
    default = {}
}

/*
  "apim-service-dependencies" = {
      service_name           = "apim-service-dependencies"
      description            = "apim-service-dependencies"
      # vsys                   = "vsys1"  # optional, default to vsys1
      destination_port       = "443,1433,5671,5672,445,1886,25,587,25028,6381-6383,4290,12000"
      source_port            = ""
      protocol               = "tcp"
      # override_session_timeout = false  # default is inherit from application
    }
*/