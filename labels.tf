locals {
  shared_labels = tomap(
    {
      "name"    = lower("${var.teamid}-${var.prjid}"),
      "team"    = lower(var.teamid),
      "project" = lower(var.prjid)
    }
  )
}
