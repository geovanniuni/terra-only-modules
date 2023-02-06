terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-only-modules-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform/state/"
    #prefix            = "terraform/state/terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

provider "google" {
  region  = "us-central1"
  project = "terra-only-modules"
}


#---------------------------------------------------

module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  name_instance    = "apache-v1"
  ip_name_static   = "ip-apache-v1"
}

module "web_app_2" {
  source = "../web-app-module"

  # Input Variables
  name_instance    = "apache-v2"
  ip_name_static   = "ip-apache-v2"
}


