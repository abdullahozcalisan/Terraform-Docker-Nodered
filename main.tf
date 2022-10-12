resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
}


resource "docker_image" "nodered" {
  name = var.image[terraform.workspace]
}


resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "mkdir noderedvol"
  }
}


resource "docker_container" "nodered" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image = docker_image.nodered.latest
  ports {
    internal = var.int
    external = var.ext[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path      = "${path.cwd}/noderedvol"
  }
}