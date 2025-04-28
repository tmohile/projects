# This is a Git repository for opentofu config files.
This repository shall contain IaC configuration files

#This README file shall be used to track changes.
28-APR-2025 12:30 - Changed top level GIT reposiroty from tofuconfig to projects:
projects
    └── tofuconfig
        ├── gitlog
        ├── main.tf
        ├── README.md
        ├── terraform.tfstate
        ├── terraform.tfstate.backup
        ├── terraform.tfvars
        ├── tofuconfig_20250428_1206.git.log
        └── variables.tf
Now git is tracking the projects folder.

28-APR-2025 12:00 - .gitignore was updated to ignore *.log , *.log* files

22-APR-2025 15:45 - Successfully done tofu aply, this causes *.tfstate.* files which should not be backed to git as they contain sensitive information.
tofu apply
data.vsphere_datacenter.dc: Reading...
data.vsphere_datacenter.dc: Read complete after 0s [id=datacenter-3]
data.vsphere_datastore.datastore: Reading...
data.vsphere_compute_cluster.cluster: Reading...
data.vsphere_network.network: Reading...
data.vsphere_virtual_machine.template: Reading...
data.vsphere_network.network: Read complete after 0s [id=dvs-1019]
data.vsphere_datastore.datastore: Read complete after 0s [id=datastore-1029]
data.vsphere_compute_cluster.cluster: Read complete after 0s [id=domain-c35]
data.vsphere_virtual_machine.template: Read complete after 0s [id=4230e5c2-af9b-dbae-cddd-6bc83920ab19]

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

21-APR-2025 15:45 - Successfully added one vm template.
tofu plan
data.vsphere_datacenter.dc: Reading...
data.vsphere_datacenter.dc: Read complete after 0s [id=datacenter-3]
data.vsphere_compute_cluster.cluster: Reading...
data.vsphere_network.network: Reading...
data.vsphere_datastore.datastore: Reading...
data.vsphere_virtual_machine.template: Reading...
data.vsphere_network.network: Read complete after 0s [id=dvs-1019]
data.vsphere_datastore.datastore: Read complete after 0s [id=datastore-1029]
data.vsphere_virtual_machine.template: Read complete after 0s [id=4230e5c2-af9b-dbae-cddd-6bc83920ab19]
data.vsphere_compute_cluster.cluster: Read complete after 0s [id=domain-c35]

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

21-APR-2025 15:10 - Added one network. Adding VM template failed.
tofu plan
data.vsphere_datacenter.dc: Reading...
data.vsphere_datacenter.dc: Read complete after 0s [id=datacenter-3]
data.vsphere_datastore.datastore: Reading...
data.vsphere_compute_cluster.cluster: Reading...
data.vsphere_network.network: Reading...
data.vsphere_network.network: Read complete after 0s [id=dvs-1019]
data.vsphere_datastore.datastore: Read complete after 0s [id=datastore-1029]
data.vsphere_compute_cluster.cluster: Read complete after 0s [id=domain-c35]

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

21-APR-2025 14:45 - Added one cluster and one datastore.
tofu plan
data.vsphere_datacenter.dc: Reading...
data.vsphere_datacenter.dc: Read complete after 0s [id=datacenter-3]
data.vsphere_datastore.datastore: Reading...
data.vsphere_compute_cluster.cluster: Reading...
data.vsphere_datastore.datastore: Read complete after 0s [id=datastore-1029]
data.vsphere_compute_cluster.cluster: Read complete after 0s [id=domain-c35]

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

21-APR-2025 11:45 - Intial opentofu config done for vsphere and vsphere api connected successfully. Below output.
 tofu plan
data.vsphere_datacenter.dc: Reading...
data.vsphere_datacenter.dc: Read complete after 1s [id=datacenter-3]

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
