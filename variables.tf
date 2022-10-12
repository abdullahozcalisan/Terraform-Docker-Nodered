variable image {
  type = map(any)
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}


locals {
  container_count = length(var.ext[terraform.workspace])
}

variable ext {
  type = map(any)
  default = {
    dev  = [1980, 1981]
    prod = [1880, 1881]
  }
}

variable int {
  type        = number
  default     = 1880
}
