terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}


data "yandex_vpc_network" "vpc" {
  name = "default"
}
resource "yandex_vpc_security_group" "nsg" {
  name        = "app security group"
  description = "description for app security group"
  network_id  = data.yandex_vpc_network.vpc.id
}
resource "yandex_vpc_security_group_rule" "rule80" {
  security_group_binding = yandex_vpc_security_group.nsg.id
  direction              = "ingress"
  description            = "port-80"
  v4_cidr_blocks         = ["0.0.0.0/0"]
  port                   = 80
  protocol               = "TCP"
}
