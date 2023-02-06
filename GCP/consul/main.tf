terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-only-modules-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform-consul/state/"
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


############################################################
##
## NOTE: if you are deploying this in your production setup
## follow the instructions in the github repo on how to modify
## deploying with the defaults here as an example of the power
## of modules.
##
## REPO: https://github.com/hashicorp/terraform-aws-consul
##
############################################################

# it cannot be deployed this repository: not allowed
module "consul" {
  source = "git@github.com:hashicorp/terraform-google-consul.git"
}


