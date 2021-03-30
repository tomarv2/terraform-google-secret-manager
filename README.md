<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-secret-manager/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-google-secret-manager/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-secret-manager" /></a>
    <a href="https://github.com/tomarv2/terraform-google-secret-manager/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-secret-manager" /></a>
    <a href="https://github.com/tomarv2/terraform-google-secret-manager/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-secret-manager" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to create [Google Secret Manager](https://cloud.google.com/secret-manager/docs/quickstart)

> :arrow_right:  Terraform module to create [AWS Parameterstore](https://registry.terraform.io/modules/tomarv2/parameterstore/aws/latest)

> :arrow_right:  Terraform module to create [Azure Key Vault](https://registry.terraform.io/modules/tomarv2/key-vault/azure/latest)

# Versions

- Module tested for Terraform 0.14.
- Google provider version [3.60.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-secret-manager/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-secret-manager" /></a> in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -cloud gcloud plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -cloud gcloud apply -var='teamid=foo' -var='prjid=bar' 
```

- Run below to destroy:
```
tf -cloud gcloud destroy -var='teamid=foo' -var='prjid=bar'
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

#### Secret Manager
```
module "secret_manager" {
  source = "../"

  gcp_project = "demo-1000"
  id = "foo"
  secret = "bar"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Required APIs

**Following APIs must be enabled on the project:**

- `iam.googleapis.com`
- `secretmanager.googleapis.com`

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| google | ~> 3.60 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| accessors | An optional list of IAM account identifiers that will be granted accessor (read-only)<br>permission to the secret. | `list(string)` | `[]` | no |
| gcp\_project | The GCP project identifier where the secret will be created. | `any` | n/a | yes |
| id | The secret identifier to create; this value must be unique within the project. | `any` | `null` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| replication\_locations | An optional list of replication locations for the secret. If the value is an<br>empty list (default) then an automatic replication policy will be applied. Use<br>this if you must have replication constrained to specific locations.<br><br>E.g. to use automatic replication policy (default)<br>replication\_locations = []<br><br>E.g. to force secrets to be replicated only in us-east1 and us-west1 regions:<br>replication\_locations = [ "us-east1", "us-west1" ] | `list(string)` | `[]` | no |
| secret | The secret payload to store in Secret Manager. Binary values should be base64<br>encoded before use. | `any` | n/a | yes |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The fully-qualified id of the Secret Manager key that contains the secret. |
| secret\_id | The project-local id Secret Manager key that contains the secret. Should match<br>the input `id`. |
