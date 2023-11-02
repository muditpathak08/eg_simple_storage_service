variable "region" {
  description = "Region"
  default     = "us-east-2"
  type        = string
}

variable "bucket_name" {
  description = "Unique Name for the Bucket"
  default     = ""
  type        = string
}

variable "versioning" {
  description = "Enable/Diable versioning for S3"
  default     = "Enabled"
  type        = string

  validation {
   condition     = contains(["Enabled", "Suspended" ], var.versioning)
   error_message = "Please provide a valid value for variable versioning"
 }
}

variable "Environment" {
  type    = string
  default = "Dev"

validation {
   condition     = contains(["Dev", "Test" ,"Sandbox", "Staging", "Production"], var.Environment)
   error_message = "Please provide a valid value for variable Envrionment. Allowed values are Dev, Test, Sandbox, Staging and Production"
 }
}


variable "tags" {
    default = {
      ApplicationEnvironment             = ""
      ApplicationFunctionality              = "test@hotstar.com"
      ApplicationName              = "test@hotstar.com"
      ApplicationOwner                 = ""
      ApplicationTeam                       = ""
      VersionEnable            = ""
      BusinessOwner = "test@hotmail.com"
      BusinessTower                  = ""
      AttachedIAMPolicy              = ""
      AttachedIAMRole             = ""
      AttachedIAMUser         = ""
      TicketReference                 = ""
      DNSEntry                    = ""
    }
    description = "Tags for S3(Simple Storage Service)"
    type        = map(string)
  }