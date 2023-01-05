# Infrastructure

## AWS Zones
us-east-2

AZs us-east-2a, us-east-2b, us-east-2c

us-west-1

AZs us-west-1b, us-west-1c

## Servers and Clusters

### Table 1.1 Summary
| **Asset**            | **Purpose**                                                                               | **Size**    | **Qty**            | **DR**                                                                               |
|----------------------|-------------------------------------------------------------------------------------------|-------------|--------------------|--------------------------------------------------------------------------------------|
| EC2 Instance         | Application Front-end                                                                     | t3.micro    | 3                  | us-east-2 - Alternate in Zone 2                                                      |
| EC2 Instance         | Application Front-end                                                                     | t3.micro    | 3                  | us-west-1 - Alternate in Zone 1                                                      |
| EC2 Security Group   | Define allowed ports and protocols                                                        | N/A         | 1 in each region   |                                                                                      |
| EC2 Key Pair         | Public and Private keys for remote access to resources                                    | N/A         | 1                  | us-east-2 - Alternate in Zone 2                                                      |
| EC2 Key Pair         | Public and Private keys for remote access to resources                                    | N/A         | 1                  | us-west-1 - Alternate in Zone 1                                                      |
| S3 Bucket            | Hold ami image for us-east-2                                                              | N/A         | 1                  | separate S3 bucket in Zone 2 (us-west-1)                                             |
| S3 Bucket            | Hold ami image for us-west-1                                                              | N/A         | 1                  | separate S3 bucket in Zone 1 (us-east-2)                                             |
| App Load Balancer    | Balance traffic between available FE servers (east-2)                                     | N/A         | 1                  | Fault resilient native to ALB                                                        |
| App Load Balancer    | Balance traffic between available FE servers (west-1)                                     | N/A         | 1                  | Fault resilient native to ALB                                                        |
| EKS Cluster (east-2) | Run Prometheus and Grafana monitoring                                                     | t3.medium   | nodes_min_size = 1 | Increase the number of desired, min & max nodes within eks.tf                        |
| EKS Cluster (west-1) | Run Prometheus and Grafana monitoring                                                     | t3.medium   | nodes_min_size = 1 | Increase the number of desired, min & max nodes within eks.tf                        |
| VPC                  | Define public and private subnets, ip ranges - CIDR Blocks for both east and west regions | N/A         | 1 in each region   | Network spanning multiple AWS regions                                                |
| RDS Cluster          | Database cluster                                                                          | N/A         | 1 in each region   | Replication between Primary (writer) and Secondary (reader) cluster nodes            |
| RDS Cluster instance | cluster nodes in us-east-2                                                                | db.t2.small | 2                  | Auto failover,backup retention set to 5 days with multiple AZs & replicated to zone2 |
| RDS Cluster instance | cluster nodes in us-west-1                                                                | db.t2.small | 2                  | Auto failover, backup retention set to 5 days with multiple AZs**                    |



### Descriptions
Six application targets for the user to access.  A web instance will be online in each AZ of each region. Traffic is distributed between each web server in a region by that regions ALBs. A security group is created in each region to ensure the ingress and egress traffic allowed protocols and ports are managed for any existing or new EC2 instance. 

A EC2 key pair is created in each region to provide security credentials to a remote host proving identity of user for access to EC2 Instances.

A S3 bucket is created in each region also.  This is used in this instance to store terraform config files in a none volitile location.

Web URL held as a DNS entry which can route traffic to either region via relevant ALB.

EKS cluster is scaled initally to run on a minimum of 2 nodes offering resilience.

VPC has an east and west distribution spanning all AZs within each region.

2 node DB cluster, one node running in each of the two regions. Initial Primary node running in us-east-2

## DR Plan
### Pre-Steps:
Confirm backups in place

Ensure replication of DB is monitored to ensure a failover results in zero RPO

Utilise all Zone2 terraform modules already created.

Add additional alb modules ensuring subnets are referenced and port and protocol.

Apply the Zone2 configuration scripts.

Confirm setup of infrastructure in other region.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

Deploy Zone2 terraform scripts.

Failover the database nodes between regions if not already done.

Amend DNS record to ensure traffic is directed towards alternate regions ALB.

