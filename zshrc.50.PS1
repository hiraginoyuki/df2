#!/bin/zsh

R="%F{9}"  # Red
G="%F{8}"  # Gray
B="%F{12}" # Blue

system_name="$(uname -s)"
if ! diff /proc/1/mountinfo /proc/self/mountinfo &>/dev/null && [ "${system_name}" != "Darwin" ]; then
  CHROOT='(chroot) '
fi

if [[ "$(ps -o comm= -p $PPID 2> /dev/null || true)" =~ '(.*/)?mosh-server' ]]; then
  MOSH='(mosh) '
fi

# https://unix.stackexchange.com/a/9607/37523
[ -z "$MOSH" ] && \
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [[ "$(ps -o comm= -p $PPID 2> /dev/null || true)" =~ '(.*/)?sshd' ]]; then
  SSH='(ssh) '
fi

PS1=$(<<EOF
$G╭╴ $CHROOT$MOSH$SSH${B}%n ${G}@ ${B}%M ${G}in ${B}%~
$G╰╴ %(?:$R:$B)❥%f 
EOF
)
