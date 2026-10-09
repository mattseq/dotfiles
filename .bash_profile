#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /home/mattseq/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mattseq/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
