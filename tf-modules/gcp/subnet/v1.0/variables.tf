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

variable "subnet_name" {
  description = "The name of single ubnet inside VPC."
  type        = string
}

variable "subnet_ip_range" {
  description = "IP range of a single subnet inside VPC."
  type        = string
}

variable "subnet_region" {
  description = "Region of a subnet inside VPC."
  type        = string
}
