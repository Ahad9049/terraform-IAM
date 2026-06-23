# Terraform AWS IAM Automation

## Overview

This project automates AWS Identity and Access Management (IAM) using Terraform. It follows Infrastructure as Code (IaC) best practices by creating and managing IAM Users, Groups, Roles, Policies, Access Keys, and Instance Profiles through reusable Terraform modules.

## Features

* IAM User Creation
* IAM Group Management
* IAM Role Creation
* Custom & Managed Policy Attachments
* IAM Access Key Generation
* IAM Instance Profile Creation
* Modular Terraform Structure
* Environment-Based Deployment (Dev, Staging, Production)

## Project Structure

```text
.
├── module/
│   └── iam/
├── environments/
│   ├── dev/
│   ├── stg/
│   └── prod/
└── README.md
```

## Usage

Initialize Terraform:

```bash
terraform init
```

Validate Configuration:

```bash
terraform validate
```

Plan Deployment:

```bash
terraform plan
```

Apply Changes:

```bash
terraform apply
```

For a specific environment:

```bash
terraform apply 
```

## Outputs

* IAM User Name
* IAM Group Name
* IAM Role Name
* Instance Profile Name
* Access Key ID (Sensitive)
* Secret Access Key (Sensitive)

## Technologies

* Terraform
* AWS IAM
* AWS EC2 Instance Profiles
* Infrastructure as Code (IaC)

## Key Learning

This project demonstrates secure access management using the Principle of Least Privilege, modular Terraform design, and environment-specific deployments for scalable cloud infrastructure.
