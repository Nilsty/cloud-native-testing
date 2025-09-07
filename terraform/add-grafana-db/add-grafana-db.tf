variable "grafana_auth" {
  type = string
}

provider "grafana" {
  url  = "http://localhost:3000/"
  auth = var.grafana_auth
}

resource "grafana_folder" "my_folder" {
  title  = "Test Folder"
}

resource "grafana_dashboard" "test_folder" {
  folder = grafana_folder.my_folder.id
  config_json = jsonencode({
    "title" : "My Dashboard Title",
    "uid" : "my-dashboard-uid"
  })
}