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
    "name"             = "vggp-v60-j334-00829423b35b-dev"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j334-00829423b35b-dev.raw"
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
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCMIjTJdmXZ0lsVTPP3Q1OjBbQ3x1gHOt5jW478wmzUO1e1oSOT953am7cB1kk6HUw3n7TGhlRSQ0aHjWeWLlqw5140hgdZY88f+ZolVDHUnthee44F0ZeLGO7gN/lLGtx7ixc7CQXqGV3SPlI6mqX+kg8I1FfSCPQQAvxAQ2bbZVgNOAO9N0B/isM37LYTkzve5x+dATi5acKfC8XOmV0VV3sZ6B/jXuJOVSOpVq0Uma09iHaiJAgzB4wjEjygzKCE47lNVsr0rgoa8my+K+Edm0R6Dsy1mSJhzhxXSCa0x4devBEc8+BgUWykRjvvubCWd1Ktv9nUksSG4RVDPQRIfIOXM+57eDg5EbRp/RT3PL71jU6ABqez8nWlVTWe4Xsun82bG0MDGnrR06RSScA77bMJBvp2i+PghhgKs6NPg8o0xjob0BA8jI2WXT9Nw0uHUWtPzUksDOj3F0eT3LZakmTfuFyxygvWb+MuTWC74PJfQgF/NfDOpwqKt/baoFMy6Vv9gQA7vN0crBe+TImDEIna07ZGUOS0Bc87l1msZR04ZpCPQw4sJtkRA7d72GHtJhxUW9nLRftlG4ewHaax6iqPkLGLYXtVWPS5S4FhszT90pR+rfoiMbvo0pcYEbJV/MhLGv8LHWANndoSlZ3D0PTrU84e4YEwlsP/94WQfQ== evmercie@ptb-5cg3115p9n.irisa.fr"
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
  default = "~/.ssh/id_rsa_pulsar_cloud"
}

variable "condor_pass" {
  default = "wgpjPqIUXelFTao5"
}

variable "mq_string" {
  default = ""
}
