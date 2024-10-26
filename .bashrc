#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bashrc.private ]; then
  source ~/.bashrc.private
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR=emacsclient
export VISUAL=emacsclient
export PATH=$HOME/.local/bin:$PATH
export EMACSPATH=$PATH
export SUDO_EDITOR="emacsclient -c"
export NEXTCLOUD_PHP=/usr/bin/php-legacy
export NEXTCLOUD_PHP_CONFIG=/etc/webapps/nextcloud/php.ini
unset SSH_AGENT_PID
# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY="$(tty)"
gpg-connect-agent updatestartuptty /bye >/dev/null

alias np='nano -w PKGBUILD'
alias more=less
alias dtd="/home/mmaguire/darktable-dev/bin/darktable --configdir /home/mmaguire/.config/darktable-dev"
alias dt="/home/mmaguire/darktable-3.6/bin/darktable"
alias vv="virt-viewer -c qemu:///system mywin10"
alias ec="emacsclient -nc"

export CVSROOT=/home/mmaguire/Nextcloud/Teaching/cvsroot
export PATH=$HOME/.config/emacs/bin:$PATH

alias config='/usr/bin/git --git-dir=/home/mmaguire/.cfg/ --work-tree=/home/mmaguire'
function soundfix () {
pacmd load-module module-alsa-card device_id="0" name="pci-0000_00_1b.0" card_name="alsa_card.pci-0000_00_1b.0" namereg_fail=false tsched=no fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1"
}
