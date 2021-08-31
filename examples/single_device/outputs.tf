output "bigips" {
  value     = module.bigip.instances
  sensitive = true
}
