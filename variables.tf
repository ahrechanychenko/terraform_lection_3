variable "username" {
  type        = string
  description = "Username"
  default     = "Artem Hrechanychenko"
}

variable "netmask" {
  type        = number
  description = "cidr netmask"
  default     = 24
}

variable "enable_ipv6" {
  type    = bool
  default = true
}
variable "iam_user" {
  type = list(string)
  default = ["artem-hrechanychenko", "devops-lector"]
}
variable "source_ips_list" {
  type        = list(any)
  description = "sources ip list for firewall"
  default     = ["192.168.1.0/24", "10.0.0.0/8"]
}

variable "users" {
  type = map(any)
  default = {
    user1 = {
      first_name = "John"
      last_name  = "Doe"
      team       = "Sales"
    },
    user2 = {
      first_name = "Suzy"
      last_name  = "Boss"
      team       = "support"
    }
  }
}

variable "set_example" {
  type    = set(any)
  default = ["one", "one", 1, 3, 1]
}

variable "project_id" {
  default = "ahre-rnd"
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "instances_config" {
  type = map(any)
  default = {
    instance1 = {
      machine_type  = "f1-micro"
      instance_name = "smallest"
      zone          = "europe-west2-a"
      network       = "vpc1"
    },
    instance2 = {
      machine_type  = "n1-standard-1"
      instance_name = "bigger"
      zone          = "europe-west2-a"
      network       = "vpc2"
    }
  }
}


