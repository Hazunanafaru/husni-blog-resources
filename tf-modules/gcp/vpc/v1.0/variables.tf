/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project" {
  description = "The project ID to where VPC will created."
  type        = string
}

variable "vpc_name" {
  description = "The name of VPC."
  type        = string
}

variable "enable_service_network_connection" {
  description = "Do you want to enable service network connection?"
  type        = bool
}

variable "enable_svpc_connector" {
  description = "Do you want to enable serverles VPC connector?"
  type        = bool
}
variable "private_ip_name" {
  description = "The name of Private IP Address."
  type        = string
  default     = ""
}

variable "private_ip_first_address" {
  description = "First IP address for Private IP Address Allocation with range /16."
  type        = string
  default     = ""
}

variable "svpc_connector_name" {
  description = "The name of Serverless VPC Connector."
  type        = string
  default     = ""
}

variable "svpc_connector_machine_type" {
  description = "Machine type of Serverless VPC Connector."
  type        = string
  default     = "f1-micro"
}

variable "svpc_connector_max_instances" {
  description = "Max number of Serverless VPC Connector Instances."
  type        = number
  default     = 3
}

variable "svpc_connector_min_instances" {
  description = "Min number of Serverless VPC Connector Instances."
  type        = number
  default     = 2
}

variable "svpc_connector_ip_range" {
  description = "Reserved IP range of Serverless VPC Connector Instances."
  type        = string
  default     = ""
}

variable "svpc_region" {
  description = "Region of a svpc instances."
  type        = string
  default     = ""
}

