locals {
  project       = "input-vars-local-output"
  project_owner = "dipen"
  cost_center   = "0001"
  managed_by    = "Terraform"

  commontags = {
    project       = local.project
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
  }
}