# ~/.zprofile
# ------------
#
# config for login shells

if [ -f /etc/profile ]; then
    . /etc/profile
fi

if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

if [ -f ~/.shrc ]; then
    . ~/.shrc
fi

# create LOGDIR if needed
#if [ ! -d "$LOGDIR" ]; then
    #mkdir -p "$LOGDIR"
    #chown -R $USER:$USER "$LOGDIR"
    #chmod 770 "$LOGDIR"
#fi

# do not load profile if inside a chroot or lxc container
# if [ -f /etc/debian_chroot ] || [ -f /etc/debian_lxc ] ; then
#     export PATH=/bin:/usr/bin:$PATH
#     return
# fi

export PATH="/Users/tom/.local/share/solana/install/active_release/bin:$PATH"

# Added by `rbenv init` on Wed Aug 28 09:44:18 -03 2024
eval "$(rbenv init - --no-rehash zsh)"
