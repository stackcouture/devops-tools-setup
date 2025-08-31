## DevOps Tools Setup

This repository provides a Terraform configuration to provision and orchestrate your **DevOps tool stack**—including SonarQube, Nexus, and Dependency‑Track—on a dedicated server (or servers).

### Table of Contents

- [Overview](#overview)  
- [Architecture](#architecture)  
- [Prerequisites](#prerequisites)  
- [Getting Started](#getting-started)  
- [Directory Structure](#directory-structure)  
- [Configuration](#configuration)  
- [Usage](#usage)  
- [Outputs](#outputs)  
- [Contributing](#contributing)  
- [License](#license)

---

### Overview

This Terraform project simplifies the deployment of key DevOps tools in a modular, scalable manner. It currently supports the provisioning of:
- **SonarQube** — for code quality analysis  
- **Nexus** — for artifact and repository management  
- **Dependency‑Track** — for software composition analysis and vulnerability tracking  

It can be extended easily to include additional tools or environments in the future.

---

### Architecture

- A single server (could be virtualized or cloud-hosted) running:
  - Jenkins Server
  - Jenkins Agent 
  - SonarQube
  - Nexus Repository Manager
  - Dependency‑Track
- Orchestrated entirely with Terraform for infrastructure provisioning and configuration.

### Terraform Infrastructure Architecture Overview

## 1. Virtual Private Cloud (VPC)

    | Property         | Value                         |
    |------------------|-------------------------------|
    | Name             | `Dev-VPC`                     |
    | CIDR Block       | `10.0.0.0/16`                 |
    | DNS Support      | Enabled (`enable_dns_support = true`) |
    | DNS Hostnames    | Enabled (`enable_dns_hostnames = true`) |
    | Tenancy          | `default`                     |

## 2. Internet Gateway
    - **Name:** `VPC-IGW`
    - Attached to `Dev-VPC` to allow internet access for public subnets.

## 3. Subnets

### Public Subnets

- **Names:**
  - `Public-Subnet-1`
  - `Public-Subnet-2`
  - `Public-Subnet-3`
  - `Public-Subnet-4`

- **CIDR Blocks:**
  - `10.0.0.0/26`
  - `10.0.0.64/26`
  - `10.0.0.128/26`
  - `10.0.0.192/26`

- **Availability Zones:**
  - `ap-south-1a`
  - `ap-south-1b`

> 💡 Each AZ likely hosts at least two subnets to provide redundancy and high availability.

## 4. Security Groups

- **Jenkins SG:** `Jenkins-SG`
- **Artifact Analysis SG:** `Artificact-analysis-SG`
- **Bastion Host SG:** `Bastion-SG`

> These security groups control inbound/outbound traffic for each respective EC2 instance group.

## 5. Route Table

- **Name:** `Public-RT`
- **Associated With:** Public subnets

**Routes:**
- Local VPC traffic
- Default route (`0.0.0.0/0`) via the Internet Gateway for public access

## 6. EC2 Instances

### Jenkins Server
- **Type:** `t3.small`
- **Tag:** `Jenkins Server`
- Likely placed in a public subnet to allow webhook/API access.

### Jenkins Agent
- **Type:** `t3.small`
- **Tag:** `Jenkins Agent`
- Works alongside the Jenkins master node to execute CI/CD jobs.

### Artifact & Analysis Server
- **Type:** `t3.large`
- **Tag:** `Artifact and Analysis Server`
- Could be used for hosting tools like SonarQube, Nexus, or custom artifact repositories.

### Bastion Host
- **Type:** `t3.medium`
- **Tag:** `Bastion Host`
- Used for secure SSH access to instances in private subnets  
  *(though your setup currently only includes public subnets)*.

---

### Prerequisites

Ensure you have:

- [Terraform (v1.5.0 or later)](https://www.terraform.io/downloads.html)
- Access to a cloud provider or on-prem environment (e.g., AWS, Azure, GCP, VMware)
- Credentials configured for your provider (`aws configure`, etc.)
- Optional: `git` for cloning the repo

---

### Getting Started

**Clone the repo:**

```bash
   git clone https://github.com/stackcouture/devops-tools-setup.git
   cd devops-tools-setup
```

---

### Deployment Instructions

Follow the steps below to initialize and deploy the Terraform infrastructure:

### 1. Initialize Terraform

This command will initialize the working directory and download necessary provider plugins:

```bash
terraform init
```

### 2. Review or customize variables in terraform.tfvars, such as instance size, region, or tool configuration.

Plan the deployment:
```bash
terraform plan
```

### 3. Apply the configuration:
```bash
terraform apply
```
---

## Directory Structure

```bash
.
|── keys/
├── modules/                # Reusable modules for each tool (e.g., SonarQube, Nexus)
├── provider.tf             # Cloud provider configuration
├── variables.tf            # Variable definitions and documentation
├── terraform.tfvars        # Example values for configuration
├── main.tf                 # Root Terraform configuration invoking modules
├── outputs.tf              # Exposed outputs like server IPs or URLs
└── README.md               # This documentation
```
--- 

### Configuration

Key variables include:

- **`region`** – Cloud region for deployment  
  _Example:_ `ap-south-1`, `us-east-1`

- **`instance_type`** – Size of server instance  
  _Example:_ `t3.medium`, `Standard_B2s`

- **`tool_ports`** – Ports for deployed tools and services  
  _Example:_  
  - `9000` for SonarQube  
  - `8081` for Nexus  
  - `8082` for Dependency‑Track

You can customize these values in the `terraform.tfvars` file or override them at runtime using the `-var` flag:

```bash
terraform apply -var="instance_type=t3.medium" -var="region=ap-south-1"
```
---

### Usage

After deployment, the following services will be accessible via the public IP of the respective EC2 instance:

- **Jenkins:**  
  `http://<server-ip>:<jenkins-track-port>`

- **SonarQube:**  
  `http://<server-ip>:<sonarqube-port>`

- **Nexus:**  
  `http://<server-ip>:<nexus-port>`

- **Dependency‑Track:**  
  `http://<server-ip>:<dp-track-port>`

> 🔐 Use the credentials specified during deployment to log in and configure each tool.
---

### Outputs

Outputs are defined in the `outputs.tf` file and may include:

- **`server_ip`** — Your server’s public or private IP address
- **`sonarqube_url`** — Full URL to access SonarQube
- **`nexus_url`** — Full URL to access Nexus
- **`dp_track_url`** — Full URL to access Dependency‑Track

These outputs will be displayed after a successful `terraform apply`.

---

### Contributing

Contributions are welcome! Here’s how you can help:

- Submit issues or feature requests via GitHub Issues.
- Fork the repository and submit pull requests.
- Add support for additional tools or environments.

---
### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.