# variable address_name {
#     description = "Description name"
#     default     = "" // "localnet" // "" 
# }

# variable address_value {
#     description = "address value"
#     default     = "" // "192.168.80.0/24"
# }

# variable address_description {
#     description = "address description"
#     default     = "" //"address description"
# }

# variable add_obj_type {
#     Description = "The type of address object."
#     default     = "IP-Range"
# }

variable address_list{
    type = map(any)
    default = {}
    
} 

# variable tags {
#     description = "Tags associated with address"
#     type        = list(string)
#     default     =  "[]" //["internal"] //["internal", "dmz"]
    
# }

