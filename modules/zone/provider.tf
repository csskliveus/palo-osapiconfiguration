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
    #api_key  = "LUFRPT1qQWhCc1Q3df2fgHKDSlosdD27LopqanbDAQsddUVSVkkwQ0hWQXZZN25DSTBpVTA9QXo1SVNRSW1QL2lyaHlkWUlaNjhzVHI1eCtVZ0cvNk5SYkV6dGNDV1V2NDdwRnJRaTVQUkUxWVV1Rm9LU29PMg=="
    verify_certificate = false
  }
