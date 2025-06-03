# Application Infrastructure on AWS using Terraform

This repository provisions a highly available, secure, and scalable web application infrastructure on AWS using Terraform.

---

## Architecture

- **VPC**: Custom VPC with public and private subnets across multiple Availability Zones.
- **Public Subnets**: Host the server and frontend load balancer.
- **Private Subnets**: Host application servers (frontend) and load balancer.
- **NAT Gateway**: Allows outbound internet access for private subnets.
- **Security Groups**: Restrict traffic between tiers and from the internet.
- **RDS (MySQL)**: Multi-AZ deployment for high availability.
- **S3 Backend**: Stores Terraform state securely for team collaboration.

---

## Features

✅ Multi-AZ deployment for all tiers  
✅ Automated bootstrapping of EC2 instances  
✅ Secure storage of secrets and configuration  
✅ Modular, reusable Terraform code  

---

## 🗂️ Directory Structure

```plaintext
Modules/
├── Network
│   ├── vpc.tf
│   ├── internet_gw.tf
│   ├── subnets.tf
│   ├── routing_tables.tf
│   ├── nat_gw.tf
│   └── security_groups.tf
├── ec2
│   ├── launch_templates.tf
│   ├── autoscaling-group.tf
│   └── instance.tf
├── Security
│   ├── ec2-security-group.tf
│   └── security-group.tf
├── loadbalancer
│   ├── lb.tf
│   └── target-group.tf
```
**Configure variables:**  
Edit the `dev.tfvars` file to set your AWS region, CIDR blocks, for Dev environment-specific variables.
Edit the `prod.tfvars` file to set your AWS region, CIDR blocks, for Prod environment-specific variables.

---

**Initialize Terraform:**

```bash
terraform init  
```
**Review the execution plan:**

```bash
terraform plan
```
***Apply the configuration for Dev env:**
```bash
terraform apply -var-file=dev.tfvars
```
***Apply the configuration for Prod env:**
```bash
terraform apply -var-file=prod.tfvars
```

## Inputs
Configuration variables (editable in `terraform.tfvars`):

- VPC and subnet CIDRs
- Subnet-to-tier mapping

---

## Outputs
Upon deployment, Terraform will output:

- VPC ID
- EC2 ID
- Load balancer DNS