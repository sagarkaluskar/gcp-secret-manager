terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

resource "google_secret_manager_secret" "this" {
  secret_id = "${var.name_prefix}-secret"
  replication {
    auto {}
  }
}
