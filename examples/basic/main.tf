#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it reserves a
# floating public IP (not yet associated with any network interface).
#####################################################################################

module "public_ip" {
  source = "../.."

  project_id = var.project_id

  public_ips = {
    floating = {
      # network_interface_id left unset → reserve a floating IP.
    }
  }

  labels = {
    managed_by = "terraform"
    example    = "basic"
  }
}
