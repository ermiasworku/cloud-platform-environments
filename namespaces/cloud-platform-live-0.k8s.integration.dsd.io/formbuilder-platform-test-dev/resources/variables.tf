# auto-generated from fb-cloud-platforms-environments
variable "environment-name" {
  default = "test-dev"
}
variable "team_name" {
  default = "formbuilder-${var.environment-name}"
}

variable "db_backup_retention_period_submitter" {
  default = "2"
}

variable "db_backup_retention_period_user_datastore" {
  default = "2"
}

variable "is-production" {
  default = "false"
}

variable "infrastructure-support" {
  default = "Form Builder form-builder-team@digital.justice.gov.uk"
}

// The following two variables are provided at runtime by the pipeline.
variable "cluster_name" {}

variable "cluster_state_bucket" {}