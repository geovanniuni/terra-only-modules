terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-only-modules-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform/backend-resource"
    #prefix            = "terraform/state/terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

# gcloud init 
# gcloud auth application-default login 
# billing

provider "google" {
  region  = "us-central1"
  project = "terra-only-modules"
}


resource "google_storage_bucket" "terraform_state" {
  name          = "bucket-terra-only-modules-geo"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  #public_access_prevention = "enforced"

  versioning {
    enabled = true
  }


}
