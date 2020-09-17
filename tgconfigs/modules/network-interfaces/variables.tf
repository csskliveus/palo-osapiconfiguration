variable public_routes {
    type = map(any)
    default = {}
}

variable private_routes {
    type = map(any)
    default = {}
}

variable management_profile_name {
    description = "Management profile name"
    default = ""
}

variable management_profile_permitted_ips {
    description = "Management profile permitted ips"
    type        = list(string)
    default     = []
}