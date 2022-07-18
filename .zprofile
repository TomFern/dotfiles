# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && . "$HOME/.fig/shell/zprofile.pre.zsh"
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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && . "$HOME/.fig/shell/zprofile.post.zsh"
