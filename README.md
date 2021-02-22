[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
# terraform-google-secret-manager
terraform module for secret manager

# Versions

- Module tested for Terraform 0.14.
- Google provider version [3.57.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest tag in your releases)

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
export TF_GCLOUD_PREFIX=<remote state bucket prefix>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Change to: 
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base 
``` 

- Run and verify the output before deploying:
```
tf -cloud gcloud plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud gcloud apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud gcloud destroy -var-file <path to .tfvars file>
```

Please refer to example directory [link](example/README.md) for references.
