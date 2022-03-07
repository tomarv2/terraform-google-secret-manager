variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}
/*
variable "project" {
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project))
    error_message = "The project_id must be a string of alphanumeric or hyphens, between 6 and 30 characters."
  }
  description = <<EOD
The GCP project identifier where the secret will be created.
EOD
}
*/
