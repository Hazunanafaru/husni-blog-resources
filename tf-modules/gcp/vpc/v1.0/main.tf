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

# Create VPC network
resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

# Allocate IP ranges for Private Service Connection
resource "google_compute_global_address" "private_ip_alloc" {
  count         = var.enable_service_network_connection == true ? 1 : 0
  project       = var.project
  name          = var.private_ip_name
  purpose       = "VPC_PEERING"
  address       = var.private_ip_first_address
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

# Create a private connection
resource "google_service_networking_connection" "service_network_connection" {
  count                   = var.enable_service_network_connection == true ? 1 : 0
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc[0].name]
}

# Create Serverless VPC Access Connector
resource "google_vpc_access_connector" "svpc_connector" {
  count         = var.enable_svpc_connector == true ? 1 : 0
  project       = var.project
  name          = var.svpc_connector_name
  network       = google_compute_network.vpc_network.self_link
  machine_type  = var.svpc_connector_machine_type
  min_instances = var.svpc_connector_min_instances
  max_instances = var.svpc_connector_max_instances
  region        = var.svpc_region
  ip_cidr_range = var.svpc_connector_ip_range
}
