terraform {
    required_providers {
      panos = {
        source = "PaloAltoNetworks/panos"
        version = "1.6.3"
      }
    }
  }
  
  provider "panos" {
    # Configuration options
    hostname = "52.156.70.150"
    username = "testuser"
    password = "testP@ssw0rd"
  }