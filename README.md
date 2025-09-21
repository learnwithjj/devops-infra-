# Terraform - EC2 Jumpbox and RDS Deployment

This repository contains Terraform code to provision an **EC2 jumpbox** and an **RDS instance** for secure database access.  
The EC2 jumpbox acts as a bastion host, allowing administrators to securely connect to the RDS instance without exposing it publicly.

---

## 📌 Architecture

- **VPC**
  - Public subnet (for EC2 jumpbox)
  - Private subnet (for RDS instance)
- **Security Groups**
  - Jumpbox: SSH access from trusted IPs
  - RDS: Accepts traffic only from the jumpbox
- **EC2 Jumpbox**
  - Amazon Linux 2 / Ubuntu (customizable)
  - Used for SSH tunneling into the RDS
- **RDS**
  - PostgreSQL 
  - Deployed in a private subnet

---
Security Considerations

RDS is deployed in a private subnet, inaccessible from the public internet.

Only the jumpbox has access to RDS.

Jumpbox allows SSH access only from trusted IPs.

---------------

# GitHub Workflows in `.github/workflows`

This directory contains the automation workflows for repository and team management, CI/CD, and infrastructure provisioning, leveraging GitHub Actions. Each workflow is defined via a YAML file and automates specific tasks related to DevOps practices.

## Workflow List & Summary

### 1. `approve_env_deployments_approval.yml`
Automates approval for environment deployments via issue comments or manual dispatch. It checks user/team permissions and, if authorized, approves pending deployments for specified environments (`dev`, `uat`, `prod`). Unauthorized users receive feedback via issue comments.

### 2. `cd.yml`
Implements Continuous Deployment (CD) for Java and React Native components. Triggered via workflow calls or manual dispatch, it downloads artifacts from GitHub Packages and deploys them to the specified environment (`dev`, etc.) using Maven for Java or direct APK download for React Native.

### 3. `create_ec2_dispatch.yml`
Provisions AWS EC2 instances using Terraform. Accepts inputs for environment, EC2 name, Terraform log level, and action (`plan`, `apply`, `destroy`). It configures AWS credentials and runs Terraform commands based on user selection.

### 4. `create_new_repository.yml`
Creates a new GitHub repository when an issue is opened/edited with a specific label, or via workflow dispatch. Details (name, description) are parsed from issue content or input fields, and a new repository is created in the organization.

### 5. `create_new_repository_approval.yml`
Handles approval for new repository creation via issue comments or manual dispatch. Only users with admin permissions can approve and trigger repository creation. Others receive feedback about insufficient permissions.

### 6. `create_new_team_approval.yml`
Manages approval and creation of new GitHub teams. Only users with admin permissions can approve team creation via comments or workflow dispatch. Permissions (`pull`, `push`) are assigned as per inputs.

### 7. `create_rds_cluster.yml`
Provisions AWS RDS clusters and associated EC2 resources using Terraform. Accepts environment, EC2/RDS names, log level, and action. It configures AWS credentials and runs Terraform for provisioning or destruction.

### 8. `repository_role_policy_approve.yml`
Automates adding teams to repositories for role-based access control. Triggered by issues or manual dispatch, teams (Leads, Developers) are assigned permissions (`admin`, `push`) to specified repositories.

### 9. `user_to_team_approve.yml`
Adds GitHub users to organization teams. Inputs include username and team name; roles assigned are either `maintainer` (Leads) or `member` (Developers). Confirmation and feedback are provided via issue comments.

---
