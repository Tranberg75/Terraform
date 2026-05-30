resource "proxmox_vm_qemu" "vm-instance" {
    name                = "vm-instance"
    target_node         = "odin"
    clone               = "Ubuntu-2604-template"
    full_clone          = true
    cpu {
        cores = 2
    }
        memory              = 2048
        bios = "ovmf"

    disk {
        slot = "scsi0"
        size            = "32G"
        type            = "disk"
        storage         = "local-lvm"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr1"
        VLAN = 80
        firewall  = false
        link_down = false
    }

}