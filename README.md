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

Use strong database credentials and rotate regularly.
