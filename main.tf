provider "aws" {
    access_key = "AKIA2TWD67TLELBSXK64"
    secret_key = "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"
    region = "us-east-2"
}

module devopsb16-testvpc {
  source = "app.terraform.io/ChandDEVOPS/vpc/aws"
  version = "1.0.0"
vpc_cidr = "10.120.0.0/16"
vpc_name = "DevOpsB16-TestVpc"
IGW_name = "DevOpsB16-Test-IGW"
key_name = "WorkingkeypairPEM"
azs = ["us-east-2a","us-east-2b","us-east-2c"]
public_subnets = ["10.120.1.0/24","10.120.2.0/24","10.120.3.0/24"]
private_subnets = ["10.120.10.0/24","10.120.20.0/24","10.120.30.0/24"]
Main_Routing_Table =   "Main_Routing_Table"
Private_Routing_Table = "Private_Routing_Table"
environment = "Prod"
}

module devopsb16-ec2 {
  source = "app.terraform.io/ChandDEVOPS/ec2/aws"
  version = "1.0.0"
imagename = "ami-0b9064170e32bde34"
instance_type = "t2.nano"
key_name = "WorkingkeypairPEM"
iam_instance_profile = "${module.devopsb16test_iam.instprofile}"
machinecount = "${module.devopsb16-testvpc.env == "Prod" ? 3 : 1 }"
sgid = "${module.devopsb16-testvpc.sgid}"
vpcname = "${module.devopsb16-testvpc.vpcname}"
public-subnets = "${module.devopsb16-testvpc.all_public_subnets}"
}