provider "google" {
  credentials = "${file("../account.json")}"
  project = "terraform-course"
  region = "europe-west1"
}

provider "aws" {
  region = "eu-central-1"
}

provider "azurerm" {
  subscription_id = "0"
  client_id = "1"
  client_secret = "2"
  tenant_id = "3"
}
