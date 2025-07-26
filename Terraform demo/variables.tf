# Variable for specifying the Google Cloud project ID.
# This is required to associate resources with the correct project.
variable "project" {
  description = "Google Cloud project ID"
}

# Variable for the name of the compute instance.
# This will be used to identify the instance in the Google Cloud Console.
variable "instance_name" {
  description = "Name of the compute instance"
  default     = "mariadbtransformersinstance" # Default name for the instance
}

# Variable for the machine type of the compute instance.
# Determines the hardware configuration (CPU, memory) of the instance.
variable "machine_type" {
  description = "Machine type for the instance"
  default     = "e2-micro" # Default machine type
}

# Variable for the zone where the compute instance will be deployed.
# Specifies the geographical location of the instance.
variable "zone" {
  description = "Zone for the instance"
}

# Variable for the boot disk image to be used for the instance.
# Specifies the operating system and version for the instance.
variable "image" {
  description = "Boot disk image"
  default     = "debian-cloud/debian-11" # Default image (Debian 11)
}