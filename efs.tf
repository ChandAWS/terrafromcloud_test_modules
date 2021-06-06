module devopsb16test_efs {
  source = "app.terraform.io/ChandDEVOPS/efs/aws"
  version = "1.0.0"
  efsname  = "DevOpsB17EFS"
  subnets = "${module.devopsb16-testvpc.all_public_subnets}"
  sg = "${module.devopsb16-testvpc.sgid}"
}