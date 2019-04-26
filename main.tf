provider "aws" {
   region     = "us-east-1"
  access_key = "<AK>"
  secret_key = "<SK>"
  version = "~> 2.2"
}

resource "aws_emr_cluster" "emr-test-cluster" {
  name          = "Big-Data-Cluster-IAC-Terraform"
  release_label = "emr-5.21.0"
  applications  = ["Spark","Hive","Hadoop","Spark","Zeppelin","Hue","Tez","ZooKeeper","Sqoop"]
  termination_protection = false
  keep_job_flow_alive_when_no_steps = true


  ec2_attributes {
    subnet_id                         = "<subnet_id>"
    emr_managed_master_security_group = "<sg-master>"
    emr_managed_slave_security_group  = "<sg-slave>"
    instance_profile                  = "EMR_EC2_DefaultRole"
    key_name                          = "<name>"
  }

    master_instance_type = "m3.xlarge"
    core_instance_type   = "m3.xlarge"
    core_instance_count  = 1

    tags {
      environment = "<env>"
      criticality = "<low/high/moderate>"
      managedbyterraform = "yes"
    }
  service_role = "EMR_DefaultRole"
}
