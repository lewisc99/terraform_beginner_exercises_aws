variable "project_name" {
  description = "The project name for tagging"
  type        = string
}

# instance type is a string that specifies the type of EC2 instance to launch. The instance type determines the hardware of the host computer used for your instance. Each instance type offers different compute and memory capabilities, and you can choose the one that best fits your needs.
# The instance type is in the format t2.micro, m5.large, etc. The instance type is used to determine the hardware of the host computer used for your instance. Each instance type offers different compute and memory capabilities, and you can choose the one that best fits your needs.
# The instance type is a string that specifies the type of EC2 instance to launch. The instance type determines the hardware of the host computer used for your instance. Each instance type offers different compute and memory capabilities, and you can choose the one that best fits your needs.
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

#AMI is Amazon Machine Image, which is a template that contains the software configuration (operating system, application server, and applications) required to launch an instance.
# An AMI includes the following: a template for the root volume for the instance (for example, an operating system, an application server, and applications), launch permissions (which control which AWS accounts can use the AMI to launch instances), and block device mapping (which specifies the volumes to attach to the instance when it is launched).
# The AMI ID is a unique identifier for the AMI, which is used to launch instances. The AMI ID is in the format ami-xxxxxxxx, where xxxxxxxx is a unique identifier.
variable "ami_id" {
  description = "AMI ID to launch the instance"
  type        = string
}
