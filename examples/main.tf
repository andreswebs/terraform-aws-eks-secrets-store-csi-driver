module "secrets_store_csi_driver_resources" {
  source                                 = "github.com/andreswebs/terraform-aws-eks-secrets-store-csi-driver"
  chart_version_secrets_store_csi_driver = var.chart_version_secrets_store_csi_driver
}