module "secret_manager" {
  source = "../"

  gcp_project = "demo-1000"
  id          = "foo"
  secret      = "bar"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
