provider "yandex" {
}

locals {
  cores = 2
  memory = 4
  image_id = "fd8hedriopd1p208elrg" #Centos7
  ssh-keys = "cloud-user:${file("~/.ssh/id_rsa.pub")}"
}

resource "yandex_compute_instance" "el-instance" {
  name = "el-instance"
  platform_id = "standard-v1"

  resources {
    cores  = local.cores
    memory = local.memory
  }

  boot_disk {
    initialize_params {
      image_id = local.image_id 
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.elk_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }
}

resource "yandex_compute_instance" "k-instance" {
  name = "k-instance"
  platform_id = "standard-v1"

  resources {
    cores  = local.cores
    memory = local.memory
  }

  boot_disk {
    initialize_params {
      image_id = local.image_id 
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.elk_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }
}

resource "yandex_compute_instance" "app-instance" {
  name = "app-instance"
  platform_id = "standard-v1"

  resources {
    cores  = local.cores
    memory = local.memory
  }

  boot_disk {
    initialize_params {
      image_id = local.image_id 
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.elk_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }
}

resource "yandex_vpc_network" "elk_network" {
  name = "elk_network"
}

resource "yandex_vpc_subnet" "elk_subnet" {
  name           = "elk_subnet"
  v4_cidr_blocks = ["10.2.0.0/24"]
  network_id     = yandex_vpc_network.elk_network.id
}
