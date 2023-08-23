// Change this file according to your cloud infrastructure and personal settings
// All variables in < > should be checked and personalized

variable "nfs_disk_size" {
  default = 300
}

variable "flavors" {
  type = map
  default = {
    "central-manager"       = "m1.medium"
    "nfs-server"            = "m1.medium"
  }
}
variable "flavors_exec_nodes" {
  default = ["m2.xlarge", "m1.2xlarge", "m2.large"]
}

variable "flavors_exec_gpu_nodes" {
  default = "m2.4xlarge"
}


variable "exec_node_count" {
  default = 3
}

variable "gpu_node_count" {
  default = 1
}

variable "image" {
  type = map
  default = {
    "name"             = "vggp-v60-j340-e3937ea797ed-dev"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j340-e3937ea797ed-dev.raw"
    // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
    "container_format" = "bare"
    "disk_format"      = "raw"
  }
}

variable "gpu_image" {
  type = map
  default = {
    "name"             = "vggp-gpu-v60-j16-4b8cbb05c6db-dev"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-gpu-v60-j16-4b8cbb05c6db-dev.raw"
    // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
    "container_format" = "bare"
    "disk_format"      = "raw"
  }
}

variable "public_key" {
  type = map
  default = {
    name   = "id_rsa_pulsar_cloud"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj4wW7PwB5u/XoTocbIGBXFG8PT6pfOp9MvtR55uhg7Vz+Kqdam+csQdID8seBbgAlbQ8UkxOlU6AlRROFk2BCj7aoBUL1J8qR8VN23dSgvoUjFTgAIkSRFb2D4j56u4DICkxnLQUX1TLiz1ZOCniaoqxtR8bsXrFteZMA4mpQdZYWv2/eN+iNdtmAAwKnsSssA2S4qLQXM82y/P9yvE6Olq261yoSJLpb9ml4qAEvA9SfjFCJc+PYsPHwYnaMn4lYup4WuliB2We6PD0o/rzJ53xraIYPomt8l9mf/viXQC4fu2m+r4O0pX3dkf1FaPp3q9HrU9WzeUbbrlhiQWQ/ Generated-by-Nova"
  }
}

variable "name_prefix" {
  default = "vgcn-fr01-"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = list
  default = [
    "public-ssh",
    "ingress-private",
    "egress-public",
  ]
}

variable "secgroups" {
  type = list
  default = [
    "ingress-private", //Should open at least nfs, 9618 for HTCondor and 22 for ssh
    "egress-public",
  ]
}

variable "public_network" {
  type = map
  default = {
    name        = "genouest-ext"
    subnet_name = "genouest-v4"
    cidr4       = "192.168.100.0/23" //This is important to make HTCondor work
  }
}

variable "jump_host" {
  default = "evmercie@genossh.genouest.org"
}

variable "ssh-port" {
  default = "22"
}

//set these variables during execution terraform apply -var "pvt_key=<~/.ssh/my_private_key>" -var "condor_pass=<MyCondorPassword>"
variable "pvt_key" {
  default = "~/.ssh/id_rsa_pulsar_cloud.pem"
}

variable "condor_pass" {
  default = ""
}

variable "mq_string" {
  default = ""
}
