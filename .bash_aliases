export Sony_WH_CH700N="38:18:4C:92:DA:41"
alias headon="bluetoothctl connect $Sony_WH_CH700N"
alias headoff="bluetoothctl disconnect $Sony_WH_CH700N"
alias headreset="bluetoothctl power off && bluetoothctl power on"

alias ssh_dka_root="ssh -i ~/.ssh/rackhost_dka root@91.227.139.55"
alias ssh_dka="ssh -i ~/.ssh/rackhost_dka_nonroot dka@91.227.139.55"

alias mount_wlkmn="sudo mount /dev/disk/by-label/WALKMAN /media/matyi/"
alias umount_wlkmn="sudo umount /media/matyi/"

alias myconfig='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
