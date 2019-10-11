data "template_file" "script" {
    template = "${file("script.tpl")}"

    vars {
        my_ip = "${var.my_ip}"
    }
}