#  Scalable AWS Infrastructure with Terraform

##  Overview

This project implements a scalable cloud infrastructure on AWS using Terraform.

It is designed to automatically handle varying traffic loads while maintaining availability and optimizing resource usage.

---

##  Problem Statement

Traditional deployments often suffer from:

- Fixed infrastructure (cannot handle spikes)
- Over-provisioning (wasted cost)
- Under-provisioning (downtime under load)

---

##  Solution

A scalable architecture using:

- Auto Scaling Groups for dynamic capacity
- Load Balancer for traffic distribution
- Multi-AZ deployment for high availability
- Infrastructure as Code (Terraform)

---

##  Architecture

Internet → Load Balancer → Auto Scaling EC2 → RDS (Private)

---

## Tech Stack

- AWS (VPC, EC2, ALB, RDS, IAM)
- Terraform
- CloudWatch

---

##  Features

- Auto Scaling based on CPU utilization
- Load-balanced traffic distribution
- Multi-AZ infrastructure
- Private database (RDS)
- Infrastructure fully defined in Terraform
- Monitoring via CloudWatch

---

##  How It Works

User → ALB → EC2 Instances → RDS

1. User sends request


2. Load Balancer distributes traffic


3. EC2 instances handle application logic


4. Database stores persistent data


5. Auto Scaling adjusts instance count based on load


---

## Scaling Strategy

Target tracking policy (CPU-based)

Scale-out during high load

Scale-in during low usage

Minimum and maximum instance limits defined

---

##  Security Highlights

RDS deployed in private subnets

Controlled access via Security Groups

IAM roles used instead of credentials

---

##  Cost Considerations

Small instance types (t3.micro)

Auto Scaling prevents idle resource waste

Minimal always-on infrastructure

---

##  Key Decisions

Used Auto Scaling instead of fixed EC2 for elasticity

Chose ALB for better traffic management

Kept database private for security

> Detailed reasoning available in /docs/decisions.md

---

## Deployment

``` bash
terraform init
terraform apply

