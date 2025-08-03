# Terraform Projects: Tasks 1–14

This README documents 14 Terraform configurations that demonstrate essential Infrastructure as Code concepts using AWS as the provider. Each task builds on core principles such as resource creation, dynamic logic, conditionals, reusability, dependency management, and lifecycle behavior.

---

## 📂 Task 1: Create a Basic VPC

* Creates a VPC with CIDR `10.0.0.0/16`.
* Uses `variables.tf` to define a region.
* Tags VPC as `main-vpc`.

---

## 📂 Task 2: Create Subnets Dynamically

* Uses a list of Availability Zones.
* Loops with `count` to create subnets.
* Uses `cidrsubnet()` to divide the VPC CIDR.

---

## 📂 Task 3: Region-Specific AMI Selection

* Uses `map` variable to store AMIs per region.
* EC2 instance uses the correct AMI dynamically.
* Region is configurable.

---

## 📂 Task 4: MySQL Configuration with Tuple

* Tuple for DB instance type, replication, and monitoring.
* Outputs tuple parts with labels.
* Launches RDS with dynamic instance class.

---

## 📂 Task 5: EC2 Instances from Map of Objects

* Uses `for_each` to loop over EC2 configs.
* Each object holds `instance_type` and `ami`.
* Auto-tags resources by map key.

---

## 📂 Task 6: EC2 and S3 from Map + List

* EC2: Loops over a map to create 3 instances.
* S3: Loops over a list to create 3 unique buckets.
* Uses `toset()` for list-to-loop conversion.

---

## 📂 Task 7: VPC with Locals and Tags

* Centralizes project/environment/tags in `locals`.
* Uses `merge()` to tag resources.
* Subnets created with `for_each` from CIDR list.

---

## 📂 Task 8: Conditional Resource Provisioning

* Uses booleans, `count`, `ternary`, and `locals`.
* Provisions EC2 only if flags match.
* Dynamically selects instance types per environment.

---

## 📂 Task 9: VPC and Static Security Group

* Creates a basic VPC using `vpc_cidr` variable.
* Static security group allows SSH/HTTP/HTTPS.
* Tags and resources are clearly defined.

---

## 📂 Task 10: Security Group with Dynamic Ingress

* Uses `dynamic "ingress"` block.
* Ingress ports are passed via variable.
* Cleanly loops over port list (22, 80, 443).

---

## 📂 Task 11: IAM Users, Roles, and Policies

* IAM User `ustglobal`:

  * Attached to managed policy and inline policy.
* IAM Role `MyRole`:

  * Assumed by EC2.
  * Attached to both managed and custom policies.
  * Inline policy grants EC2 + S3 list permissions.

---

## 📂 Task 12: Lifecycle Block for EC2 Instance

* Uses `lifecycle` block:

  * `create_before_destroy = true`
  * `prevent_destroy = true`
  * `ignore_changes = [tags]`
* Protects EC2 from accidental termination.

---

## 📂 Task 13: Launch EC2 with Latest Amazon Linux 2 AMI

* Uses `data "aws_ami"` to fetch latest AMI.
* Automatically uses updated OS versions.
* Ensures EC2 instance is always fresh.

---

## 📂 Task 14: Explicit Dependencies and Lifecycle Behavior

* Security Group `example_sg` allows SSH.
* EC2 Instance `example_instance`:

  * Depends explicitly on SG using `depends_on`.
  * Lifecycle rules:

    * `create_before_destroy = true`
    * `prevent_destroy = true`
* Demonstrates:

  * Implicit vs explicit dependencies.
  * Destruction order and resource protection.

---

## 📄 Summary

This series of 14 Terraform tasks illustrates:

* Fundamental AWS infrastructure components
* Dynamic and reusable infrastructure
* Conditional logic and lifecycle customization
* Dependency handling with and without `depends_on`

Use these examples to learn or teach foundational Terraform patterns used in production-grade infrastructure deployments.
