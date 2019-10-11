output "instance_ip" {
  value = "${aws_instance.nextcloud-server.public_ip}"
}
