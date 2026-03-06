# Architecture Diagram
## AWS 3-Tier Architecture

![AWS 3 Tier Architecture](./images/aws-3tier-architecture.png)

Project: AWS 3-Tier Highly Available Architecture (Terraform)

This repository demonstrates the design and provisioning of a production-style AWS 3-Tier Architecture using Infrastructure as Code (Terraform). The objective of this project is to build a secure, scalable, and highly available infrastructure following cloud architecture best practices.

The architecture separates the infrastructure into three logical layers:
	•	Presentation Layer
	•	Application Layer
	•	Database Layer

Each layer is deployed in separate subnets and availability zones to improve security, scalability, and fault tolerance.


Architecture Overview

The infrastructure is deployed inside a custom VPC and distributed across multiple subnets. The design follows standard enterprise patterns used in real cloud environments.

Components

Networking Layer
	•	Custom VPC
	•	Internet Gateway
	•	Public and Private Subnets
	•	Route Tables
	•	NAT Gateway
	•	Security Groups

Compute Layer
	•	Bastion Host for secure SSH access
	•	Private Application Servers
	•	Auto Scaling Group for application tier

Load Balancing
	•	Application Load Balancer (ALB)
	•	Target Groups for application instances

Database Layer
	•	Amazon RDS MySQL
	•	Database instances deployed in private subnets


Architecture Flow
	1.	A user accesses the application through the Application Load Balancer (ALB).
	2.	The ALB distributes incoming traffic across multiple application servers located in private subnets.
	3.	The application servers process requests and communicate with the RDS MySQL database hosted in the database subnet.
	4.	Administrative access to the private infrastructure is performed through a Bastion Host located in the public subnet.
	5.	The Bastion host allows secure SSH tunneling to the private instances without exposing them to the internet.
	6.	The NAT Gateway enables private instances to access the internet for updates and package installations without being publicly accessible.


High Availability Design

To increase reliability and fault tolerance, the infrastructure is distributed across multiple availability zones.

Key availability features:
	•	Application servers deployed across two private subnets
	•	Load balancing through Application Load Balancer
	•	Database deployed within isolated subnets
	•	Future expansion capability for additional NAT gateways

This design ensures that the failure of a single availability zone does not disrupt the entire application.


Security Considerations

Security is implemented using layered isolation.

Key Security Controls
	•	Public internet access limited to ALB and Bastion Host
	•	Application servers deployed in private subnets
	•	Database servers isolated in database subnets
	•	Security groups restrict traffic between tiers
	•	Bastion host used for controlled administrative access


Infrastructure Provisioning

All infrastructure resources are created using Terraform.

Terraform modules included in the project:
	•	VPC creation
	•	Subnet provisioning
	•	Route tables
	•	Internet gateway
	•	NAT gateway
	•	EC2 instances
	•	Auto scaling configuration
	•	Application Load Balancer
	•	RDS database

Terraform ensures that infrastructure is:
	•	Reproducible
	•	Version controlled
	•	Easily deployable

Future Enhancements

This project represents the foundational infrastructure layer of a scalable cloud-native application architecture. The current implementation focuses on provisioning a secure and highly available infrastructure using Terraform and core AWS services.

Future iterations of this architecture will extend the platform to support containerized workloads and modern orchestration frameworks.

Planned improvements include:

Containerization

Application services will be packaged into Docker containers to ensure consistent environments across development, testing, and production. Containerization will simplify deployment workflows and improve portability across infrastructure environments.

Key benefits:
	•	Environment consistency
	•	Faster deployment cycles
	•	Simplified application dependency management
	•	Improved scalability

Kubernetes Orchestration

The application layer will be migrated to a Kubernetes-based container orchestration platform.

Potential implementation options include:
	•	Amazon EKS (Elastic Kubernetes Service)
	•	Self-managed Kubernetes clusters on EC2

Kubernetes will enable:
	•	Automated container scheduling
	•	Self-healing infrastructure
	•	Rolling deployments and rollbacks
	•	Horizontal pod autoscaling
	•	Service discovery and load balancing

This transition will move the architecture toward a fully cloud-native microservices platform.

CI/CD Integration

Future versions will also incorporate a complete CI/CD pipeline to automate the build and deployment process.

Potential toolchain:
	•	GitHub Actions or Jenkins
	•	Docker image build pipelines
	•	Automated Kubernetes deployments
	•	Infrastructure validation using Terraform

Observability and Monitoring

Operational visibility will be enhanced through integrated monitoring and logging.

Possible tools include:
	•	Prometheus
	•	Grafana
	•	AWS CloudWatch
	•	Loki for centralized logging

This will provide real-time insights into infrastructure health, application performance, and system reliability.