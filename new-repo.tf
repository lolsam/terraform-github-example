provider "github" {
  token        = "${var.ghtoken}"
  organization = "samit-a" #enter your github account/organization name here
  version      = "~> 1.3"
}

resource "github_repository" "repo" {
  name               = "tf-github-example"
  description        = "This repo was created using Terraform"
  gitignore_template = "Terraform"
  has_issues         = true
  has_wiki           = true
  private            = true

  lifecycle {
    prevent_destroy = true #to prevent repo destruction on terraform destroy
  }
}

#Set as environment variable
variable "ghtoken" {}

#Returns the ssh url for you to git clone
output "ssh_clone_url" {
  value = "${github_repository.repo.ssh_clone_url}"
}
