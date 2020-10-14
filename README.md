# Dynatrace ActiveGate

## About

Dynatrace ActiveGates are deployed into AWS VPCs to function as a proxy between Dynatrace OneAgent agents and the Dynatrace Managed Cluster. Dynatrace agents collect performance and service metrics from EC2 instances and send these as messages to be ingested for analysis by the Dynatrace Cluster. AGs (ActiveGates) play a key role in buffering, compressing and encrypting these messages before routing them to the correct endpoints.

Included in this repository are Terraform scripts and modules to deploy Dynatrace Environment ActiveGates into CRUK's AWS environments. By deploying three instances into subnets in the Shared VPCs we will be able to share these resources between all accounts using a shared VPC.

**Dynatrace ActiveGate infrastructure for a single shared VPC**

![Dynatrace ActiveGate infrastructure for a single shared VPC](docs/images/cruk-dt-activegate-overview-900x642.png)

The official literature [When do I need to install an ActiveGate?](https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-managed/basic-concepts/overview-of-dynatrace-managed/#dynatrace-managed-cluster) gives further detail on the benefits of deploying AGs while the role of ActiveGates and how they fit into the overall architecture are described in [Scenario 2: Pure Dynatrace Managed setup](https://www.dynatrace.com/support/help/shortlink/managed-deployment-scenarios#scenario-2-pure-dynatrace-managed-setup).

## Installation

* Clone the repository https://github.com/CRUKorg/cruk_activity_management_web_service.git

* Ensure Terraform version is greater than v0.12.20

## Notes ##

This is an active project and a work in progress and as such the list of proposed objectives for this solution may change.

Work for this activity is being tracked under [Jira ticket AWS-190](https://jira.cancerresearchuk.org/browse/AWS-190)
