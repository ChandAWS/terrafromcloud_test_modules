#Creating Role with name DevOpsB16TestRole
# module devopsb16test_iam {
#   source = "app.terraform.io/ChandDEVOPS/iam/aws"
#   version = "1.0.0"
#   rolename  = "DevOpsB16TestRole"
#   envname = "${module.devopsb16-testvpc.env}"
#   instanceprofilename = "devopsb16test-ins-profile"
# }

# #Creating IAM Policy and assigning to DevOpsB16TestRole
# module devopsb16_iam_policy {
#   source = "app.terraform.io/ChandDEVOPS/iam-attachment/aws"
#   version = "1.0.0"
#   attachroles = "${module.devopsb16test_iam.rolename}"
#   policyname = "devopsb16-iam-policy1"
# }