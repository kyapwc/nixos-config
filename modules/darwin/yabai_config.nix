{pkgs}:
let content = ''
# Loading Addons
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa

# First Desktop
yabai -m config layout float
yabai -m config window_placement second_child

# Second Desktop
yabai -m config --space 1 layout bsp
yabai -m config --space 2 layout bsp
yabai -m config --space 3 layout bsp
yabai -m config --space 4 layout bsp
yabai -m config --space 5 layout bsp
yabai -m config --space 6 layout bsp
yabai -m config --space 7 layout bsp
yabai -m config --space 7 layout bsp
yabai -m config --space 8 layout bsp
yabai -m config --space 9 layout bsp
yabai -m config --space 10 layout bsp

# Labelling Spaces
yabai -m space 1 --label Code
yabai -m space 2 --label Slack
yabai -m space 3 --label "XCode / Postico"
yabai -m space 4 --label "Browser / Testing"
yabai -m space 5 --label Misc

yabai -m config top_padding 40
yabai -m config bottom_padding 10
yabai -m config left_padding 10
yabai -m config right_padding 10
yabai -m config window_gap 12

yabai -m config --space 1 top_padding 42
yabai -m config --space 1 bottom_padding 5
yabai -m config --space 1 left_padding 5
yabai -m config --space 1 right_padding 5
yabai -m config --space 1 window_gap 5

yabai -m config --space 2 left_padding 0
yabai -m config --space 2 right_padding 0
yabai -m config --space 2 top_padding 34

# Yabai borders
# yabai -m config active_window_border_color 0xff00b3f4
yabai -m config window_border on
yabai -m config window_border_width 2
yabai -m config active_window_border_color 0xbdff93f9
yabai -m config normal_window_border_color 0xff555555
yabai -m config window_border_blur off

yabai -m config window_topmost off

yabai -m rule --add app="^System Preferences$" manage=off layer=above
yabai -m rule --add app="^System Information$" manage=off layer=above
yabai -m rule --add app="^Accessibility Inspector$" manage=off layer=above
yabai -m rule --add app="^Activity Monitor$" manage=off layer=above
yabai -m rule --add app="^Calendar$" manage=off layer=above
yabai -m rule --add app="^Disk Utility$" manage=off layer=above
yabai -m rule --add app="^FaceTime$" manage=off layer=above
yabai -m rule --add app="^Finder$" manage=off layer=above
yabai -m rule --add app="^Firefox$" title="^Opening " manage=off
yabai -m rule --add app="^Firefox$" title="^Picture-in-Picture$" manage=off
yabai -m rule --add app="^Font Book$" manage=off
yabai -m rule --add app="^Keychain Access$" manage=off layer=above
yabai -m rule --add app="^Mail$" manage=off
yabai -m rule --add app="^Photos$" manage=off
yabai -m rule --add app="^Postgres$" manage=off
yabai -m rule --add app="^Swipes$" manage=off
yabai -m rule --add app="^System Preferences$" manage=off
yabai -m rule --add app="^The Unarchiver$" manage=off
yabai -m rule --add app="^Security & Privacy$" manage=off
yabai -m rule --add app="^Network$" manage=off
yabai -m rule --add app="^Digital Colour Meter$" manage=off layer=above
yabai -m rule --add app="^Simulator$" manage=off border=off layer=above
yabai -m rule --add app="^Reactotron$" manage=off border=off sticky=off layer=above
yabai -m rule --add app="^emulator64-crash-service" manage=off border=off layer=above
yabai -m rule --add app="^emulator" manage=off border=off layer=above
yabai -m rule --add app="^QuickTime Player$" manage=off layer=above
yabai -m rule --add app="^Movie Recording$" manage=off layer=above
yabai -m rule --add app="^Firefox$" title="^Opening .*$" manage=off layer=above
yabai -m rule --add app="^Monosnap$" manage=off layer=above
yabai -m rule --add app="^Slack \| Slack call.*" manage=off layer=above
yabai -m rule --add app="^Postico$" title="^Find$" manage=off layer=above
yabai -m rule --add app="^qutebrowser$" layer=above
yabai -m rule --add app="^Expressions$" manage=off layer=above
yabai -m rule --add app="^Notes$" manage=off layer=above
yabai -m rule --add app="^emulator$" manage=off layer=above
# yabai -m rule --add app="^Slack$" manage=off layer=above
yabai -m rule --add app="^TeamViewer$" manage=off layer=above
yabai -m rule --add app="^Godot$" manage=off layer=above
yabai -m rule --add app="^Bear$" manage=off layer=above
yabai -m rule --add app="^Panda$" manage=off layer=above
yabai -m rule --add app="^KeyCastr$" manage=off layer=above
yabai -m rule --add app="^Firefox$" title="Print" manage=off layer=above
# yabai -m rule --add app="^Alacritty$" manage=off layer=above border=off
yabai -m rule --add app="^Notational Velocity$" manage=off layer=above
yabai -m rule --add app="^Craft$" manage=off layer=above
yabai -m rule --add app="^Typora$" manage=off layer=above
yabai -m rule --add app="^Notable$" manage=off layer=above
yabai -m rule --add app="^Obsidian$" manage=off layer=above
# yabai -m rule --add app="^Python$" title="^pygame window$" manage=off layer=above
# yabai -m rule --add app="^Python$" manage=off layer=above
# yabai -m rule --add app="^Archive Utility$" manage=off layer=above
# yabai -m rule --add app="^Alacritty$" opacity=0.8 manage=on
yabai -m rule --add app="^Alacritty$" manage=on
yabai -m rule --add app="^Steam$" manage=off
yabai -m rule --add app="^Archive Utility$" manage=off
yabai -m rule --add app="^Arc$" subrole="^AXSystemDialog$" manage=off mouse_follows_focus=off
yabai -m rule --add app="^Arc$" title="^Shortcuts$" manage=off
yabai -m rule --add app="^Arc$" title="^Space [0-9]+" subrole="^AXSystemDialog$" manage=off layer=above
yabai -m rule --add app="^TablePlus$" title="Window" manage=off layer=above
yabai -m rule --add app="^TablePlus$" title="tableplus plugins" manage=off layer=above
yabai -m rule --add app="^TablePlus$" title="^$" manage=off layer=above

# Refresh item
# yabai -m signal --add event=window_focused \
#   action="osascript -e 'display notification \"Testing\" with title \"Yabai\"'"

# borders active_color=0xff00b3f4 inactive_color=0xff555555 width=5.0 &
yabai -m signal --add event=window_focused action="sketchybar -m --trigger window_focus &> /dev/null"
yabai -m signal --add event=window_title_changed action="sketchybar -m --trigger title_change &> /dev/null"
'';

in content
