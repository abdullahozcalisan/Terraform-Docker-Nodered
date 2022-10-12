output "ip_address" {
  value = [for i in docker_container.nodered : join(":", [i.ip_address], i.ports[*]["external"])]

}
output "image_name" {
  value = docker_image.nodered.name
}

output "container_name" {
  value = docker_container.nodered[*].name
}