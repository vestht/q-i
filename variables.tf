variable "region" {
	type = string
	nullable = false
	default = "ap-southeast-1"
}

locals {
	envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
}
