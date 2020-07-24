variable "front_door_name" {
  description = "The name to assign the new Front Door Resource in Azure"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the new Front Door resource should be created"
  type        = string
}

variable "fe_host_name" {
  description = "The FQDN of the Front-End endpoint (example - front-door.azure.net)"
  type        = string
}

variable "be_host_header" {
  description = "The value to use as the host header sent to the backend."
  type        = string
}

variable "be_address" {
  description = "Location of the backend (IP address or FQDN)"
  type        = string
}

variable "enforce_cert_check" {
  description = "Enforce certificate name check on HTTPS requests to all backend pools, True or False value."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to assign to the Front Door resource. Key = Value (MAP) pairs"
  type        = map(string)
  default     = { Terraform = "True", Environment = "DEV" }
}