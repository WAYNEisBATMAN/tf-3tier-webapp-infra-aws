
terraform-aws — 3‑Tier Web App Infrastructure

This repository provides a complete Infrastructure as Code (IaC) solution for deploying a **3-tier web application** on AWS using Terraform. The modular architecture separates networking, compute, database, storage, and monitoring into independent, reusable components for enhanced maintainability and scalability.


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
│   └── outputs.tf
│
├── compute/
│   ├── main.tf              # EC2, ALB 
│   ├── variables.tf
│   └── outputs.tf
│
├── database/
│   ├── main.tf              # RDS, DynamoDB
│   ├── variables.tf
│   └── outputs.tf
│
├── storage/
│   ├── main.tf              # S3 buckets
│   ├── variables.tf
│   └── outputs.tf
│
└── monitoring/
    ├── main.tf              # CloudWatch 
    ├── variables.tf
│   └── outputs.tf


```


---
## 🚀 What this repo provisions
Network: VPC, public and private subnets (multi-AZ), Internet Gateway, NAT Gateway(s), route tables, and security groups.

Compute: EC2 instances for the web / app tier, an Application Load Balancer (ALB) for HTTP/HTTPS traffic, and autoscaling hooks (optional).

Database: RDS (MySQL/Postgres) in private subnets with a DB subnet group and optional DynamoDB table for session or ephemeral data.

Storage: S3 buckets for assets, logs, and backups with appropriate lifecycle rules and encryption.

Monitoring: CloudWatch alarms, dashboards, and metrics for core resources.

This setup implements a classic 3‑tier architecture (presentation via ALB + Web EC2, application tier on EC2, data tier on RDS/DynamoDB).



---
## ✅ Prerequisites
Terraform v1.4+ recommended

Required Tools:
Terraform >= 1.0.0 (Installation Guide)
AWS CLI >= 2.0 (Installation Guide)
Optionally configure a remote backend (S3 + DynamoDB) for state locking in backend.tf.

AWS Requirements:
AWS Account with appropriate permissions
AWS Access Keys (Access Key ID and Secret Access Key)
IAM permissions for:
VPC, EC2, RDS, S3, DynamoDB
Load Balancers, Auto Scaling Groups
CloudWatch, IAM roles



---
## 🚀 Getting Started

1. **Clone the Repository**
   ```bash
   git clone https://github.com/WAYNEisBATMAN/tf-3tier-webapp-infra-aws.git
   cd tf-3tier-webapp-infra-aws
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

This command:
Downloads required provider plugins (AWS)
Initializes the backend for state storage
Prepares modules for use

3. **Validate Configuration**
   ```bash
   terraform validate
   ```

4. **Preview Changes**
   ```bash
   terraform plan
   ```

Review the planned changes carefully. Terraform will show:
Resources to be created
Estimated costs (if cost estimation is enabled)
Dependencies between resources

5. **Deploy Infrastructure**
   ```bash
   terraform apply
   ```

Type yes when prompted to confirm deployment.

Deployment Time: Approximately 10-15 minutes

---



## ♻️ Cleanup
terraform destroy from the root will attempt to delete all resources the modules created.

If state mismatches occur, consider terraform state rm for orphaned items before destroying.