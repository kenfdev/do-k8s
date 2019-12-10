variable "do_token" {}
variable "do_cluster_name" {
  default = "test-k8s"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "my_digital_ocean_cluster" {
  name    = var.do_cluster_name
  region  = "nyc1"
  version = "1.16.2-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

output "cluster-id" {
  value = digitalocean_kubernetes_cluster.my_digital_ocean_cluster.id
}