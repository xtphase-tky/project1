# Scaling Strategy

## Overview

This system uses horizontal scaling to handle variable traffic loads efficiently.

---

## Auto Scaling Configuration

- Minimum instances: 2
- Desired instances: 2
- Maximum instances: 5

---

## Scaling Method

### Target Tracking Scaling

- Metric: CPU Utilization
- Target: 50%

### Behavior

- If CPU > 50% → scale out (add instances)
- If CPU < 50% → scale in (remove instances)

---

## Why Target Tracking?

- Automatically adjusts capacity
- Requires minimal manual tuning
- Maintains stable performance

---

## Load Distribution

- Application Load Balancer distributes traffic evenly
- Only healthy instances receive traffic

---

## Stateless Design

- Instances do not store session data
- Any instance can handle any request

---

## Benefits

- Handles traffic spikes automatically
- Reduces cost during low usage
- Improves system reliability
