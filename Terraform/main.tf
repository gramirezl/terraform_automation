# Configure the Azure, AWS, and Google providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-west-2"  # Cambia la región según tus necesidades
}

provider "google" {
  project = "your-gcp-project-id"  # Cambia el ID del proyecto según tus necesidades
  region  = "us-central1"          # Cambia la región según tus necesidades
}