# Infrastructure

## AWS Zones
us-east-2

AZs us-east-2a, us-east-2b, us-east-2c

us-west-1

AZs us-west-1b, us-west-1c

## Servers and Clusters

### Table 1.1 Summary
Asset											|Purpose										|Size					|Qty									|DR
--------------------------|---------------------------|-------------|---------------------|--------------------------------------------------------------------------------------
Ubuntu-Web								|Application Front-end			|t3.micro			|3										|us-east-2 - Alternate in Zone 2
Ubuntu-Web								|Application Front-end			|t3.micro			|3										|us-west-1 - Alternate in Zone 1
udacity-lb-tf							|App Load Balancer (east-2)	|N/A					|1										|Fault resilient native to ALB
udacity-lb-tf							|App Load Balancer (west-1)	|N/A					|1										|Fault resilient native to ALB
udacity-cluster						|EKS Cluster								|t3.medium		|nodes_min_size = 2		|Increase the number of desired, min & max nodes within eks.tf
udacity-project						|VPC												|N/A					|1 in each region			|Network spanning multiple AWS regions
udacity-db-instance-0 (p)	|us-east-2 node							|db.t2.small	|1										|Auto failover,backup retention set to 5 days with multiple AZs & replicated to zone2
udacity-db-instance-1 (s)	|us-west-1 node							|db.t2.small	|1										|Auto failover, backup retention set to 5 days with multiple AZs**
udacity-db-cluster				|RDS Cluster								|N/A					|Number of nodes			|
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Descriptions
Six application targets for the user to access.  A web instance will be online in each AZ of each region. Traffic is distributed between each web server in a region by that regions ALBs.

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

