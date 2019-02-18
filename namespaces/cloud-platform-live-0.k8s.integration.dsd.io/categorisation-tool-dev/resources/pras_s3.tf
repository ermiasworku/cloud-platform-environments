terraform {
  backend "s3" {}
}

/*
 * Make sure that you use the latest version of the module by changing the
 * `ref=` value in the `source` attribute to the latest version listed on the
 * releases page of this repository.
 *
 */
module "pras_offender_data_omic_s3_bucket" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-s3-bucket?ref=1.0"

  team_name              = "cloudplatform"
  business-unit          = "mojdigital"
  application            = "cloud-platform-terraform-s3-bucket"
  is-production          = "false"
  environment-name       = "development"
  infrastructure-support = "platform@digtal.justice.gov.uk"
}

resource "kubernetes_secret" "pras_offender_data_omic_s3_bucket" {
  metadata {
    name      = "pras-offender-data-omic-s3-bucket-output"
    namespace = "categorisation-tool-dev"
  }

  data {
    access_key_id     = "${module.pras_offender_data_omic_s3_bucket.access_key_id}"
    secret_access_key = "${module.pras_offender_data_omic_s3_bucket.secret_access_key}"
    bucket_arn        = "${module.pras_offender_data_omic_s3_bucket.bucket_arn}"
    bucket_name       = "${module.pras_offender_data_omic_s3_bucket.bucket_name}"
  }
}