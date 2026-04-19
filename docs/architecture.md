# Architecture Overview

## System Design

This project implements a scalable and highly available web infrastructure on AWS.

### Architecture Flow

Internet → Load Balancer → Auto Scaling Group (EC2) → RDS

### Components

#### 1. VPC
- Isolated network environment
- CIDR: 10.0.0.0/16

#### 2. Subnets
- Public subnets: Load Balancer
- Private subnets: EC2 + RDS

#### 3. Application Load Balancer
- Entry point for all traffic
- Distributes requests across EC2 instances
- Performs health checks

#### 4. Auto Scaling Group
- Maintains desired number of EC2 instances
- Automatically scales based on load

#### 5. EC2 Instances
- Stateless web servers
- Serve HTTP content

#### 6. RDS (MySQL)
- Managed database
- Multi-AZ enabled
- Private access only

#### 7. Monitoring
- CloudWatch tracks metrics and system health

---

## High Availability

- Multi-AZ deployment for EC2 and RDS
- Load balancer ensures no single point of failure

---

## Key Benefits

- Fault tolerance
- Scalability
- Isolation of components
