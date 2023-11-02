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