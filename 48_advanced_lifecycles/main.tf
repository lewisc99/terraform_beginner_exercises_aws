variable "servers" {
  # This variable defines a map of server configurations.
  # Each key is a unique identifier for the server, and the value is an object
  # containing the AMI ID and instance type.
  # The map allows for easy scaling and management of multiple servers.
  # The keys are used to identify the servers, and the values are used to
  type = map(object({
    ami           = string
    instance_type = string
  }))

  # Default values for the servers variable.
  # Each server is defined with a unique key and its corresponding AMI ID and instance type.
  # This allows for easy customization and scaling of the infrastructure.
  default = {
    "web-1" = {
      ami           = "ami-0abc1234example" # Web server AMI
      instance_type = "t3.micro"
    }
    "db-1" = {
      ami           = "ami-0def5678example" # Database server AMI
      instance_type = "t3.small"
    }
    "cache-1" = {
      ami           = "ami-0ghi9012example" # Cache server AMI
      instance_type = "t3.micro"
    }
  }
}

# This Terraform configuration creates multiple AWS EC2 instances based on the provided server configurations.
# Each instance is created with a specific AMI ID and instance type, allowing for easy scaling and management of the infrastructure.
# The instances are tagged with their unique names and roles, making it easier to identify and manage them in the AWS console.
# The configuration uses a for_each loop to iterate over the servers map, creating an instance for each entry.
resource "aws_instance" "servers" {
  for_each = var.servers # Iterate over the servers map to create multiple EC2 instances.

  ami           = each.value.ami # Use the AMI ID from the servers map for each instance.
  instance_type = each.value.instance_type # Use the instance type from the servers map for each instance.

  tags = {
    Name = each.key # Use the key from the servers map as the instance name.
    Role = lookup({
      web-1   = "web"
      db-1    = "db"
      cache-1 = "cache"
    }, each.key) # Assign a role based on the instance name.
  } 
}
