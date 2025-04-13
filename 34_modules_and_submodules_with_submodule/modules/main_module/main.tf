module "submodule1" {
  source         = "./submodule1"
  common_message = var.common_message
}

module "submodule2" {
  source         = "./submodule2"
  common_message = var.common_message
}
