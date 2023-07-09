# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "cloudvm" {
  attached_disk {
    device_name = var.disk_name
    mode        = "READ_WRITE"
    source      = "projects/groovy-karma-388506/zones/us-central1-a/disks/disk-2"
  }

  boot_disk {
    auto_delete = true
    device_name = var.device_name

    initialize_params {
      image = "projects/windows-cloud/global/images/windows-server-2022-dc-v20230510"
      size  = 50
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = var.machine

  metadata = {
    enable-windows-ssh = "TRUE"
    ssh-keys           = "subrahmanyam113:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcMryPhc1g8Ip6UAHUXh5KZ4z55PtG32TzOGfywUiRRjrqtK/cQimnoOTLLIb6niP93xJ8xayn5hBVNIkb5xgWUNNLdqyMJfcjDtpqWETKwXBaYll9YtE+ENmG5ZBK4JjdU9cXsI4KiQafO/OOKX9VhhmBunIpbstPngZN81FRXCcfCgsD9fA4gfVT8eGmA9Hxs4yfVnUHpM54fv3UPToGNSXL85p5D8kY8+mwuMm7StOlVbqPcSdczfUTbcmPdLaaW5oOjMGjLLcloiRCowVyog/vZCFC62kD7UuexcA2M3OKuYJvNQa68mBYzDCZ70SjD3yziUeGfbWrfj3yXW2A3bMrE/idtYnPJwd0wQ/eAuyqhOa7zEO1IyzTgI/Q6brgbLeiuAduzi36gSvx+sIEx11WoTfaDhjr88sgyuKyc+2Um8fuuHddVy1z4JordS9TYblTpTnvG9s7QfIivf8/f75Jtk5qTQbAKovjliMTpUKA4vHHSQYlp5K2nAmycU8= subrahmanyam113@gmail.com"
    windows-keys       = "{\"expireOn\":\"2023-07-08T07:34:29.944458Z\",\"userName\":\"user1\",\"email\":\"subrahmanyam113@gmail.com\",\"modulus\":\"iUQ4REttzGfqOQtfLc+vvqgJAlFymBfGX4IakyhRxyhJKynmXuhRENu9gFDjoZFC8N23m7MPpvB/6jhDujcvwdz08pCutDdCOpGRgWtJMzN4CD1DfNxMv8ZeLKQYGeAsoYgyo60IesJDB7PxdxRED8zG9wIpMQmvUL3/uPdAoYd1x6XHXzQEck54H+dQL+r3tJSEpufUIyinakMK5R31YYO8Nx94in3D1qTeSyDovHJvdbSB4VOoO0JN+hHzWr0oh6lAvLpwJpl+tjHIshlS4Hexspu54fb1YXNT+iPpX2TpoPcurkNboFWKNmliPgVH9qHyNC7cqy+DlkTP/9Mo0w==\",\"exponent\":\"AQAB\"}"
  }

  name = var.name

  network_interface {
    access_config {
      network_tier = "STANDARD"
    }

    subnetwork = "projects/groovy-karma-388506/regions/us-central1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "101674418114-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-central1-a"
}
