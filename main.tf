/**
* Deploys the Kubernets CSI Secrets Store Driver on AWS EKS.
*
* **Note**: This module depends on an imperative deployment of the AWS driver provider after the driver is installed:
* 
* ```sh
* kubectl apply -f "https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml"
* ```
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }

  }
}

resource "helm_release" "secrets_store_csi_driver" {
  name       = var.helm_release_name
  namespace  = var.k8s_namespace
  repository = "https://raw.githubusercontent.com/kubernetes-sigs/secrets-store-csi-driver/master/charts"
  chart      = "secrets-store-csi-driver"
  version    = var.chart_version_secrets_store_csi_driver

  recreate_pods     = var.helm_recreate_pods
  atomic            = var.helm_atomic_creation
  cleanup_on_fail   = var.helm_cleanup_on_fail
  wait              = var.helm_wait_for_completion
  wait_for_jobs     = var.helm_wait_for_jobs
  timeout           = var.helm_timeout_seconds
  max_history       = var.helm_max_history
  verify            = var.helm_verify
  keyring           = var.helm_keyring
  reuse_values      = var.helm_reuse_values
  reset_values      = var.helm_reset_values
  force_update      = var.helm_force_update
  replace           = var.helm_replace
  create_namespace  = var.helm_create_namespace
  dependency_update = var.helm_dependency_update
  skip_crds         = var.helm_skip_crds

  set {
    name  = "enableSecretRotation"
    value = var.enable_secret_rotation
  }

  set {
    name  = "syncSecret.enabled"
    value = var.enable_secret_sync
  }

  set {
    name  = "rotationPollInterval"
    value = var.rotation_poll_interval
  }

}
