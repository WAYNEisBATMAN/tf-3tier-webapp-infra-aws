
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
<!-- ## 🛠️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.12  
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured  -->
## 🛠️ Prerequisites

### Required Software
- **Terraform** >= 1.12 ([Download](https://developer.hashicorp.com/terraform/downloads))
- **AWS CLI** installed and configured ([Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))

### AWS Configuration
- AWS credentials configured via `~/.aws/credentials` (using default profile)
- Valid Access Key ID and Secret Access Key
- AWS account with appropriate IAM permissions

### Required AWS Permissions
Your IAM user or role must have permissions for:
- **Networking:** VPC, Subnets, Internet Gateway, NAT Gateway
- **Compute:** EC2, Application Load Balancer, Auto Scaling Groups
- **Database:** RDS, DynamoDB
- **Storage:** S3
- **Monitoring:** CloudWatch Logs, CloudWatch Alarms
- **Security:** IAM Roles and Policies

### Optional Configuration
- Remote backend for state management (S3 bucket + DynamoDB table)
- Configure in `backend.tf` for state locking and team collaboration

---
## 🔑 Setting up AWS Credentials

- Terraform checks for AWS credentials in this order:

1) Environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN)

2) AWS CLI credentials file (~/.aws/credentials)

3) EC2 Instance Metadata Service (IMDS) (when running inside an EC2 instance with an attached IAM role)

- We’ll use the 2nd method. To set it up:


1. **Create a Group**  
   - Go to [IAM → User groups](https://console.aws.amazon.com/iamv2/home#/groups)  
   - Click **Create group**  
   - Assign required policies (e.g., `AmazonEC2FullAccess`, `AmazonS3FullAccess`, `AmazonDynamoDBFullAccess`)  

2. **Create a User**  
   - Go to [IAM → Users](https://console.aws.amazon.com/iamv2/home#/users)  
   - Click **Add user**  
   - Enable **Programmatic access**  
   - Add the user to the group created above  
   - Save the **Access Key ID** and **Secret Access Key**  

3. **Run AWS Configure**  
   ```bash
   aws configure
   # Then it will prompt you to provide below details which you got in step 2:
   Access Key ID
   Secret Access Key
   Default region (e.g., ap-south-1)
   Output format (choose one of the options or enter to skip)   

   ```

👉 Important: For the AWS Credentials Use the default profile by:

Not specifying profile in the Terraform provider block

Not hardcoding access keys in Terraform code

---





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