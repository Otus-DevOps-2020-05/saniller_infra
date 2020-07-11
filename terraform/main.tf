provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}


resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
    //ssh-keys = "ubuntu:${file("~/.ssh/for-ubuntu-user.pub")}"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашнем задании
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    #subnet_id = "e9bu0g9e8e61a2c6fdd9"
    nat = true
  }

  # Для подключения провиженеров (установщиков) по ssh
  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }


  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
