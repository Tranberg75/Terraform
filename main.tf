resource "proxmox_vm_qemu" "vm-instance" {
    name = "test"
    target_node = "odin"
    vmid = 800 
    description = "This is a test VM created using Terraform and Proxmox provider"
    bios = "ovmf"
    start_at_node_boot = false
    agent = 1
    clone = "ubuntu-minimal-2404-template"
    full_clone = true
    os_type = "ubuntu"
    memory = 4096
    skip_ipv6 = true
    vm_state = "stopped"

cpu{
        cores = 4
        sockets = 2
        type = "x86-64-v2-AES"

    }

vga{
        type = "serial0"
    }

network {
        id = 0
        model = "virtio"
        bridge = "vmbr1"
        tag = 80
        firewall  = false
        link_down = false
    }

disk {
        storage = "local-lvm"
        size = "20G"
        discard = true   
        slot = "scsi0"        
    }    

efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

}