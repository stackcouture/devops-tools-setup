# DevOps Tools Setup

This repository provides a Terraform configuration to provision and orchestrate your **DevOps tool stack**—including SonarQube, Nexus, and Dependency‑Track—on a dedicated server (or servers).

## Table of Contents

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

## Overview

This Terraform project simplifies the deployment of key DevOps tools in a modular, scalable manner. It currently supports the provisioning of:
- **SonarQube** — for code quality analysis  
- **Nexus** — for artifact and repository management  
- **Dependency‑Track** — for software composition analysis and vulnerability tracking  

It can be extended easily to include additional tools or environments in the future.

---

## Architecture

- A single server (could be virtualized or cloud-hosted) running:
  - Jenkins Server
  - Jenkins Agent 
  - SonarQube
  - Nexus Repository Manager
  - Dependency‑Track
- Orchestrated entirely with Terraform for infrastructure provisioning and configuration.

---

## Prerequisites

Ensure you have:

- [Terraform (v1.5.0 or later)](https://www.terraform.io/downloads.html)
- Access to a cloud provider or on-prem environment (e.g., AWS, Azure, GCP, VMware)
- Credentials configured for your provider (`aws configure`, etc.)
- Optional: `git` for cloning the repo

## Getting Started

**Clone the repo:**
   ```bash
   git clone https://github.com/stackcouture/devops-tools-setup.git
   cd devops-tools-setup
```
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

## Configuration

```bash 
    Key variables include:

    region — Cloud region for deployment (e.g., us-east-1, ap-south-1)

    instance_type — Size of server instance (e.g., t3.medium, Standard_B2s)

    tool_ports — Ports for services (e.g., 9000 for SonarQube, 8081 for Nexus, 8082 for Dependency‑Track)

    Customize these in terraform.tfvars or override using -var flags.
```

## Usage

```bash 

After deployment:

Jenkins will be at http://<server-ip>:<jenkins-track-port>

SonarQube will be accessible at http://<server-ip>:<sonarqube-port>

Nexus will be available at http://<server-ip>:<nexus-port>

Dependency‑Track will be at http://<server-ip>:<dp-track-port>

Use credentials specified during deployment to log in and configure each tool.

```


