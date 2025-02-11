#tags module
module "tags" {
  source     = "./modules/tags"
  owner      = "AFT"
  automation = "terraform"
  other      = {}
}

#tags output
output "tags" { value = module.tags.map }
