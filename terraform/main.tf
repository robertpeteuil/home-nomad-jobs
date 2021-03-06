terraform {
  backend "consul" {
    path = "terraform-ncabatoff-jobs"
  }
}

provider "nomad" {}

resource "nomad_job" "mediaserver" {
  jobspec = "${file("nomad/mediaserver.hcl")}"
}

resource "nomad_job" "system-monitoring" {
  jobspec = "${file("nomad/system-monitoring.hcl")}"
}

resource "nomad_job" "dockerregistry" {
  jobspec = "${file("nomad/dockerregistry.hcl")}"
}

resource "nomad_job" "prometheus" {
  jobspec = "${file("nomad/prometheus.hcl")}"
}
