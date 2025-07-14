export Sony_WH_CH700N="38:18:4C:92:DA:41"
alias headon="bluetoothctl connect $Sony_WH_CH700N"
alias headoff="bluetoothctl disconnect $Sony_WH_CH700N"
alias headreset="bluetoothctl remove $Sony_WH_CH700N; bluetoothctl trust $Sony_WH_CH700N; bluetoothctl pair $Sony_WH_CH700N && bluetoothctl connect $Sony_WH_CH700N"

export Sony_SRS_XB33="98:52:3D:54:A1:E3"
alias spon="bluetoothctl connect $Sony_SRS_XB33"
alias spoff="bluetoothctl disconnect $Sony_SRS_XB33"
alias spreset="bluetoothctl trust $Sony_SRS_XB33; bluetoothctl pair $Sony_SRS_XB33 && bluetoothctl connect $Sony_SRS_XB33"

alias ssh_dka-r="ssh root@91.227.139.55"
alias ssh_dka="ssh -i ~/.ssh/rackhost_dka_nonroot dka@91.227.139.55"

alias mount_wlkmn="sudo mount /dev/disk/by-label/WALKMAN /media/matyi/"
alias umount_wlkmn="sudo umount /media/matyi/"

alias mcf='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

alias l='ls --group-directories-first -1'

alias displayoff='xrandr --output eDP-1 --off'
alias displayon='xrandr --output eDP-1 --auto'

# project shortcuts
alias gcs='cd ~/projects/geo-chat/server'
alias gcd='cd ~/projects/geo-chat/dev-client'

alias sok='cd $HOME/projects/sounds-of-korhal'

alias dkab='cd $HOME/projects/dka/dka-bff'
alias dkaa='cd $HOME/projects/dka/dka-api'
alias dkan='cd $HOME/projects/dka/dka-nginx-config'
alias dkas='cd $HOME/projects/dka/scraper'
alias dkaan='cd $HOME/projects/dka/dka-angular'
alias dkasv='cd $HOME/projects/dka/dka'

alias bem='cd $HOME/projects/bene-memo'

alias learnc='cd $HOME/projects/learning/c/c-programming-language-solutions'
alias azu='cd $HOME/projects/learning/react/azul'
# programming utils
alias scripts='cat package.json | jq .scripts'

# misc
alias sv='sync_vault01'
alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias vimcf='cd $HOME/.config/nvim'
