
## 📂 Project Structure

```
terraform-aws/
├── provider.tf              # Root-level provider config
├── main.tf                  # Root-level module calls
├── variables.tf             # Root-level variables
├── outputs.tf               # Root-level outputs
├── terraform.tfvars         # Root-level variable values
│
├── network/
│   ├── main.tf              # VPC, subnets, security groups
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── terraform.tfvars
│
├── compute/
│   ├── main.tf              # EC2, ALB 
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── terraform.tfvars
│
├── database/
│   ├── main.tf              # RDS, DynamoDB
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── terraform.tfvars
│
├── storage/
│   ├── main.tf              # S3 buckets
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── terraform.tfvars
│
└── monitoring/
    ├── main.tf              # CloudWatch 
    ├── variables.tf
    ├── outputs.tf
    ├── providers.tf
    └── terraform.tfvars


```