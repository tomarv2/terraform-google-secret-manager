terraform {
  required_version = ">= 0.14"
  required_providers {
    google = {
      version = "~> 3.60"
    }
  }
}

provider "google" {
  project = var.gcp_project
  //  region  = var.gcp_region
}

