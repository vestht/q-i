terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 5.45"
		}
	}
}

provider "aws" {
	region = var.region
	access_key = local.envs["access_key"]
	secret_key = local.envs["secret_key"]

	default_tags {
		tags = {
			Project = "VESTHT-Q1"
			Owner = "me@shyamin.com"
		}
	}
}