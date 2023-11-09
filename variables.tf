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
   error_message = "Please provide a valid value for variable versioning, Allowed values are Enabled or Suspended"
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

variable "ApplicationOwner" {
  description = "Owner of the Application"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@hotmail.com", "abc@gmail.com"], var.ApplicationOwner)
   error_message = "Please provide a valid Application Owner"
 }
}

variable "ApplicationTeam" {
  description = "Owner of the Application"
  type        = string
  default     = ""

  validation {
   condition     = contains(["Team1","Team2"], var.ApplicationTeam)
   error_message = "Please provide a valid Application Team"
 }
}

 variable "BusinessOwner" {
  description = "Business Owner"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@gmail.com","xyz@gmail.com"], var.BusinessOwner)
   error_message = "Please provide a valid BusinessOwner"
 }
}

variable "BusinessTower" {
  description = "Business Tower"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@gmail.com","xyz@gmail.com"], var.BusinessTower)
   error_message = "Please provide a valid BusinessTower"
 }
}



  variable "s3_tags" {
    default = {
    }
    description = "Tags for S3 bucket"
    type        = map(string)
  }