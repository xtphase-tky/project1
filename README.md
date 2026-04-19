# 🚀 Scalable AWS Infrastructure with Terraform

## 📌 Overview

This project demonstrates a production-style scalable web infrastructure built on AWS using Terraform.

The system is designed to handle variable traffic efficiently while maintaining high availability, security, and cost awareness.

---

## ❗ Problem Statement

Traditional static server setups cannot handle traffic spikes efficiently:
- Over-provisioning → high cost  
- Under-provisioning → downtime  

---

## ✅ Solution

A scalable architecture using:
- Load balancing  
- Auto Scaling  
- Multi-AZ deployment  
- Infrastructure as Code  

---

## 🏗️ Architecture

Internet → Load Balancer → Auto Scaling EC2 → RDS (Private)

> See `/docs/architecture.md` for detailed explanation

---

## ⚙️ Tech Stack

- AWS (VPC, EC2, ALB, RDS, IAM)
- Terraform (Infrastructure as Code)
- CloudWatch (Monitoring)

---

## 🔥 Features

- Auto Scaling (2 → 5 instances)
- Load-balanced traffic distribution
- Multi-AZ database deployment
- Private subnet architecture
- Stateless application design
- Monitoring with CloudWatch

---

## 📈 Scaling Behavior

- CPU-based target tracking (50%)
- Automatic scale-out and scale-in
- Load distributed across healthy instances

---

## 🔐 Security Highlights

- EC2 instances in private subnets
- RDS not publicly accessible
- IAM roles used instead of credentials
- Controlled traffic flow via load balancer

---

## 💰 Cost Considerations

- Small instance types (t3.micro)
- Auto Scaling avoids idle resources
- No unnecessary managed services

---

---

## 🚀 Deployment Steps

```bash
terraform init
terraform plan
terraform apply
