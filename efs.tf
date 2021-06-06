module devopsb16test_efs {
  source = "./modules/efs"
  efsname  = "DevOpsB17EFS"
  subnets = "${module.devopsb16-testvpc.all_public_subnets}"
  sg = "${module.devopsb16-testvpc.sgid}"
}