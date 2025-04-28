variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}
variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}
variable "vsphere_server" {
  description = "vSphere server FQDN or IP"
  type        = string
}
variable "vsphere_datacenter" {
  description = "vSphere Data Center name"
  type	      = string
}
variable "vsphere_cluster" {
  description = "vSphere Cluster name"
  type        = string
}
variable "vsphere_datastore" {
  description = "vSphere DataStore"
  type        = string
}
variable "vsphere_network" {
  description = "vSphere Network"
  type        = string
}
variable "vm_template" {
  description = "VM Template"
  type        = string
}
