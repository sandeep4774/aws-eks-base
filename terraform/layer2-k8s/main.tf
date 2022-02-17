terraform {
  required_version = "1.0.10"

  required_providers {
    aws = {
      source  = "aws"
      version = "3.64.2"
    }
    kubernetes = {
      source  = "kubernetes"
      version = "2.6.1"
    }
    helm = {
      source  = "helm"
      version = "2.4.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.1"
    }
  }
}

data "aws_caller_identity" "current" {}
