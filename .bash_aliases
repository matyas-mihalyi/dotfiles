export Sony_WH_CH700N="38:18:4C:92:DA:41"
alias headon="bluetoothctl connect $Sony_WH_CH700N"
alias headoff="bluetoothctl disconnect $Sony_WH_CH700N"
alias headreset="bluetoothctl power off && bluetoothctl power on"

export Sony_SRS_XB33="98:52:3D:54:A1:E3"
alias spon="bluetoothctl connect $Sony_SRS_XB33"
alias spoff="bluetoothctl disconnect $Sony_SRS_XB33"
alias spreset="bluetoothctl power off && bluetoothctl power on"

alias ssh_dka_root="ssh -i ~/.ssh/rackhost_dka root@91.227.139.55"
alias ssh_dka="ssh -i ~/.ssh/rackhost_dka_nonroot dka@91.227.139.55"

alias mount_wlkmn="sudo mount /dev/disk/by-label/WALKMAN /media/matyi/"
alias umount_wlkmn="sudo umount /media/matyi/"

alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

alias l='ls --group-directories-first -1'

alias display_off='xrandr --output eDP-1 --off'
