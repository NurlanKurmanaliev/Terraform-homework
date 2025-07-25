variable key_name {
  type = string
}

variable region {
  type = string
}


variable vpc {
    type = list(object({
    cidr = string
    enable_dns_support = bool
    enable_dns_hostnames = bool
  }))
  default = [
    {
    cidr = ""
    enable_dns_support = true
    enable_dns_hostnames = true
  }
  ]
}

variable subnets {
  type = list(object({
    cidr_block              = string
    az      = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
  default = [
    {
      cidr_block              = ""
      az                      = ""
      map_public_ip_on_launch = true
      name                    = ""
    },
    {
      cidr_block              = ""
      az                      = ""
      map_public_ip_on_launch = true
      name                    = ""
    },
    {
      cidr_block              = "1"
      az                      = ""
      map_public_ip_on_launch = false
      name                    = ""
    },
    {
      cidr_block              = ""
      az                      = ""
      map_public_ip_on_launch = false
      name                    = ""
    }
  ]
}

variable internet_gateway {
  type    = string
}

variable route_table {
  type    = list(string)
}

variable ports {
  type    = list(number)
}

variable ec2_web {
   type = map(string)
}
