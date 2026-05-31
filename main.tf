resource "proxmox_vm_qemu" "vm-instance" {
    name = "vm-instance"
    target_node = "odin"
    vmid = 999
    description = "This is a test VM created using Terraform and Proxmox provider"
    bios = "ovmf"
    start_at_node_boot = false
    agent = 1
    clone = "Ubuntu-2604-template"
    full_clone = true
    os_type = "ubuntu"
    memory = 4096
    skip_ipv6 = true

cpu{
        cores = 2
        sockets = 1
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
        id = 0
        type = "scsi"
        storage = "local-lvm"
        storage_type = "lvm"
        size = "20G"
        discard = "on"   
        slot = "scsi0"
        
    }    

}