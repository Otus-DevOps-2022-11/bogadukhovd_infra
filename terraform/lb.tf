resource "yandex_lb_target_group" "reddit-tg" {
  name      = "reddit-target-group"
  region_id = "ru-central1"

  dynamic "target" {
    for_each = yandex_compute_instance.app.*.network_interface.0.ip_address
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}

resource "yandex_lb_network_load_balancer" "reddit-lb" {
  name = "reddit-load-balancer"

  listener {
    name = "reddit-listener"
    port = 9292
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.reddit-tg.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
