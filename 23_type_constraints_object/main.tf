# This variable defines a person object with two attributes:
# - name: A string representing the person's name.
# - age: A number representing the person's age.
# A default value is provided with name "Bob" and age 10.
variable "person" {
  type = object({
    name = string,
    age  = number
  })

  default = {
    name = "Bob"
    age  = 10
  }
}

output "person" {
  value = var.person
}

# This variable defines a person object with an address.
# - name: A string representing the person's name.
# - age: A number representing the person's age.
# - address: An object containing:
#   - line1: A string for the first line of the address.
#   - line2: A string for the second line of the address.
#   - county: A string for the county.
#   - postcode: A string for the postcode.
# A default value is provided for a person named "Jim" with an example address.

variable "person_with_address" {
  type = object({ name = string, age = number,
    address = object({ line1 = string, line2 = string,
  county = string, postcode = string }) })

  default = {
    name = "Jim"
    age  = 21
    address = {
      line1    = "1 the road"
      line2    = "St Ives"
      county   = "Cambridgeshire"
      postcode = "CB1 2GB"
    }
  }
}

output "person_with_address" {
  value = var.person_with_address
}


# This variable defines a database configuration object with the following attributes:
# - engine: A string specifying the database engine (e.g., "mysql").
# - engine_version: A string specifying the version of the database engine.
# - instance_class: A string specifying the instance type (e.g., "db.t3.micro").
# - allocated_storage: A number specifying the storage size in GB.
# - username: A string for the database username.
# - password: A string for the database password.
# A default configuration is provided for a MySQL database.
variable "database_config" {
  type = object({
    engine         = string
    engine_version = string
    instance_class = string
    allocated_storage = number
    username       = string
    password       = string
  })

  default = {
    engine         = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    username       = "admin"
    password       = "securepassword123"
  }
}

output "database_config" {
  value = var.database_config
}

# This variable defines an AWS S3 bucket configuration object with the following attributes:
# - bucket_name: A string specifying the name of the S3 bucket.
# - acl: A string specifying the access control list (e.g., "private").
# - versioning: A boolean indicating whether versioning is enabled.
# - tags: A map of strings for tagging the bucket (e.g., Environment, Team).
# A default configuration is provided for a private bucket with versioning enabled.
variable "s3_bucket_config" {
  type = object({
    bucket_name = string
    acl         = string
    versioning  = bool
    tags        = map(string)
  })

  default = {
    bucket_name = "my-app-bucket"
    acl         = "private"
    versioning  = true
    tags = {
      Environment = "Production"
      Team        = "DevOps"
    }
  }
}

output "s3_bucket_config" {
  value = var.s3_bucket_config
}


# This variable defines a network configuration object with the following attributes:
# - vpc_id: A string specifying the ID of the VPC.
# - subnet_ids: A list of strings specifying the IDs of the subnets.
# - security_groups: A list of strings specifying the IDs of the security groups.
# A default configuration is provided with example VPC, subnets, and security groups.
variable "network_config" {
  type = object({
    vpc_id     = string
    subnet_ids = list(string)
    security_groups = list(string)
  })

  default = {
    vpc_id     = "vpc-12345678"
    subnet_ids = ["subnet-11111111", "subnet-22222222"]
    security_groups = ["sg-12345678", "sg-87654321"]
  }
}

output "network_config" {
  value = var.network_config
}

# Possible error:
# If you define a variable object with a type constraint but provide a default value
# that does not match the structure or types, Terraform will throw an error.
# For example, if you define `database_config` with `allocated_storage` as a number
# but provide a string value like `"20GB"`, Terraform will fail with a type mismatch error.