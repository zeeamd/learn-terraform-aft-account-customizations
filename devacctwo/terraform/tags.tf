#tags module
module "tags" {
  source     = "./modules/tags"
  owner      = "CT2"
  automation = "terraform"
  other      = {}
}

#tags output
output "tags" { value = module.tags.map }
