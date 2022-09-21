#standard tags output
output "map" {
 value = merge(
  var.other,
   {
    owner = var.owner,
    automation = var.automation
   }
  )
}
