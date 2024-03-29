terraform {
  source = "../../../../../tf-modules/gcp/firewall-rules//v1.0"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc/husni-blog-resources"
}

locals {
  project_id    = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).locals.project_id
  base_name     = "${basename(get_terragrunt_dir())}"
  firewall_name = "${local.base_name}-fw"
}

inputs = {
  project_id   = local.project_id
  network_name = dependency.vpc.outputs.network_name
  ingress_rules = [{
    name                    = "${local.firewall_name}-001"
    description             = "Allow ICMP from public. Mostly to test ping"
    priority                = null
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["icmp"]
    target_service_accounts = null
    allow = [{
      protocol = "icmp"
    }]
  }]
}
