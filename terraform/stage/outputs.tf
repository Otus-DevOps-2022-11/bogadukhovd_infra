output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

# output "external_ip_address_lb" {
#   value = yandex_lb_network_load_balancer.reddit-lb.listener.*.external_address_spec[*].*.address[0]
# }
