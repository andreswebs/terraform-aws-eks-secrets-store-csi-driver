# terraform-aws-eks-secrets-store-csi-driver

[//]: # (BEGIN_TF_DOCS)
Deploys the Kubernets CSI Secrets Store Driver on AWS EKS.

Note: depends on an imperative deployment of the AWS driver provider after the driver is installed:

```sh
kubectl apply -f "https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml"
```

## Usage

Example:

```hcl
module "secrets_store_csi_driver_resources" {
  source                                 = "github.com/andreswebs/terraform-aws-eks-secrets-store-csi-driver"
  chart_version_secrets_store_csi_driver = var.chart_version_secrets_store_csi_driver
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version_secrets_store_csi_driver"></a> [chart\_version\_secrets\_store\_csi\_driver](#input\_chart\_version\_secrets\_store\_csi\_driver) | Chart version | `string` | `null` | no |
| <a name="input_enable_secret_rotation"></a> [enable\_secret\_rotation](#input\_enable\_secret\_rotation) | Set Helm value `enableSecretRotation` | `string` | `"true"` | no |
| <a name="input_enable_secret_sync"></a> [enable\_secret\_sync](#input\_enable\_secret\_sync) | Set Helm value `syncSecret.enabled` | `string` | `"true"` | no |
| <a name="input_helm_atomic_creation"></a> [helm\_atomic\_creation](#input\_helm\_atomic\_creation) | Purge resources on installation failure ? The wait flag will be set automatically if atomic is used | `bool` | `true` | no |
| <a name="input_helm_cleanup_on_fail"></a> [helm\_cleanup\_on\_fail](#input\_helm\_cleanup\_on\_fail) | Deletion new resources created in this upgrade if the upgrade fails ? | `bool` | `true` | no |
| <a name="input_helm_create_namespace"></a> [helm\_create\_namespace](#input\_helm\_create\_namespace) | Create the namespace if it does not yet exist ? | `bool` | `true` | no |
| <a name="input_helm_dependency_update"></a> [helm\_dependency\_update](#input\_helm\_dependency\_update) | Run helm dependency update before installing the chart ? | `bool` | `false` | no |
| <a name="input_helm_force_update"></a> [helm\_force\_update](#input\_helm\_force\_update) | Force resource update through delete/recreate if needed ? | `bool` | `false` | no |
| <a name="input_helm_keyring"></a> [helm\_keyring](#input\_helm\_keyring) | Location of public keys used for verification; used only if verify is true | `bool` | `".gnupg/pubring.gpg"` | no |
| <a name="input_helm_max_history"></a> [helm\_max\_history](#input\_helm\_max\_history) | Maximum number of release versions stored per release; `0` means no limit | `number` | `3` | no |
| <a name="input_helm_recreate_pods"></a> [helm\_recreate\_pods](#input\_helm\_recreate\_pods) | Perform pods restart during upgrade/rollback ? | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Release name | `string` | `"secrets-store-csi-driver"` | no |
| <a name="input_helm_replace"></a> [helm\_replace](#input\_helm\_replace) | Re-use the given name, even if that name is already used; this is unsafe in production | `bool` | `false` | no |
| <a name="input_helm_reset_values"></a> [helm\_reset\_values](#input\_helm\_reset\_values) | When upgrading, reset the values to the ones built into the chart ? | `bool` | `false` | no |
| <a name="input_helm_reuse_values"></a> [helm\_reuse\_values](#input\_helm\_reuse\_values) | When upgrading, reuse the last release's values and merge any overrides ? If 'reset\_values' is specified, this is ignored | `bool` | `false` | no |
| <a name="input_helm_skip_crds"></a> [helm\_skip\_crds](#input\_helm\_skip\_crds) | Skip installing CRDs ? | `bool` | `false` | no |
| <a name="input_helm_timeout_seconds"></a> [helm\_timeout\_seconds](#input\_helm\_timeout\_seconds) | Time in seconds to wait for any individual kubernetes operation | `number` | `300` | no |
| <a name="input_helm_verify"></a> [helm\_verify](#input\_helm\_verify) | Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart | `bool` | `false` | no |
| <a name="input_helm_wait_for_completion"></a> [helm\_wait\_for\_completion](#input\_helm\_wait\_for\_completion) | Wait until all resources are in a ready state before marking the release as successful ? | `bool` | `true` | no |
| <a name="input_helm_wait_for_jobs"></a> [helm\_wait\_for\_jobs](#input\_helm\_wait\_for\_jobs) | Wait until all Jobs have been completed before marking the release as successful ? | `bool` | `true` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace | `string` | `"kube-system"` | no |
| <a name="input_rotation_poll_interval"></a> [rotation\_poll\_interval](#input\_rotation\_poll\_interval) | Set Helm value `rotationPollInterval` | `string` | `"3600s"` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The name (`metadata.name`) of the Kubernetes namespace |
| <a name="output_release"></a> [release](#output\_release) | Helm release |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.2.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.48.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.2.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.secrets_store_csi_driver](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).

## References

<https://secrets-store-csi-driver.sigs.k8s.io>

<https://github.com/aws/secrets-store-csi-driver-provider-aws>
