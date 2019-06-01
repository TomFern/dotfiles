# xinit script

#echo $USER $$ $DISPLAY >> /tmp/xsessions

# ensure pwd is $HOME
cd ~

# keyboard for Xorg
# setxkbmap -model pc101 -layout latam 
# setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -option caps:super
#(sleep 2 && /usr/bin/xkbcomp ~/.xkeymap $DISPLAY ) &
# setxkbmap -option terminate:ctrl_alt_bksp

# font settings, when installing remember to run mkfontdir where *.pcf files are
xset +fp $HOME/.fonts
xset +fp $HOME/.fonts/pcf
xset +fp $HOME/.fonts/pcf/artwiz

# screen blank
# xset s 900 900

# blank cursor: xorg-xsetroot
#xsetroot -cursor_name left_ptr

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix libreoffice on KDE backend (force gtk)
export SAL_USE_VCLPLUGIN=gtk

# force reload Xresources
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources -I$HOME

# touchpad synaptics: 1 finger tap = Left Click ; 2 finger tap = Middle Click
# ( sleep 2 && /usr/bin/synclient TapButton1=1 HorizTwoFingerScroll=1 VertTwoFingerScroll=1 ) &
#(sleep 5 && /usr/bin/synclient TouchpadOff=1 ) &
#(sleep 5 && /usr/bin/synclient ClickPad=0 ) &


# only run this on the first display
if [ "$DISPLAY" = :0 ]; then
     guake 2>&1 &
     # killall devilspie2
     # sleep 0.1
     # devilspie2 &
     # parcellite &
    #compton -CGb
    #redshift -r -v -c ~/.redshift >/tmp/redshift.log 2>&1 &
    # syndaemon -K -R -i 1 2>&1 &
     # xscreensaver -nosplash 2>&1 &
fi

# start-pulseaudio-x11

# Window Manager / Desktop Environment
sleep 1
# exec cinnamon-session

#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop
# exec mate-session
#exec start-lumina-desktop
exec startkde
