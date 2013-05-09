# set to yes if you want Conky to be forked in the background
background no

cpu_avg_samples 4
net_avg_samples 2

out_to_console no

# Use Xft?
use_xft yes

# Xft font when Xft is enabled
xftfont Sans:size=8
own_window_transparent no
#own_window_colour hotpink
# Text alpha when using Xft
xftalpha 0.8

# on_bottom yes


# Update interval in seconds
update_interval 1
# Create own window instead of using desktop (required in nautilus)
own_window yes
own_window_transparent yes
own_window_hints undecorated,below,skip_taskbar
own_window_type override

# Use double buffering (reduces flicker, may not work for everyone)
double_buffer yes

# Minimum size of text area
minimum_size 250 5
maximum_width 250

# Draw shades?
draw_shades no

# Draw outlines?
draw_outline no

# Draw borders around text
draw_borders no

# Stippled borders?
stippled_borders no

# border margins
border_margin 4

# border width
border_width 1

# Default colors and also border colors
default_color white
default_shade_color white
default_outline_color white

# Text alignment, other possible values are commented
#alignment top_left
#minimum_size 10 10
gap_x 15
gap_y 80
alignment top_right
#alignment bottom_left
#alignment bottom_right

# Gap between borders of screen and text

# Add spaces to keep things from moving about?  This only affects certain objects.
use_spacer none

# Subtract file system buffers from used memory?
no_buffers yes

# set to yes if you want all text to be in uppercase
uppercase no


TEXT
${color white}SYSTEM $stippled_hr${color}
Hostname: $alignr$nodename
Kernel: $alignr$kernel
Uptime: $alignr${color yellow}$uptime${color}


${color white}CPU $stippled_hr${color}
Temp: ${alignr}${color yellow}${acpitemp}${color}℃
${color yellow}${freq}${color}MHz ${color yellow}${cpu cpu}${color}% ${color #666}${cpubar cpu}${color}
#CPU:1  ${cpu cpu1}% ${cpubar cpu1}
#CPU:2  ${cpu cpu2}% ${cpubar cpu2}
#CPU:3  ${cpu cpu3}% ${cpubar cpu3}
#CPU:4  ${cpu cpu4}% ${cpubar cpu4}


${color white}RAM $stippled_hr${color}
Mem ${alignr}${color yellow}$mem${color} / $memmax (${color yellow}$memperc${color}%)
${color #666}${membar 6}${color}
Swap ${alignr}${color yellow}$swap${color} / $swapmax (${color yellow}$swapperc${color}%)
${color #666}${swapbar 6}${color}


# |--WLAN0
${if_up wlan0}${voffset -13}
${color white}NETWORK (${color yellow}wlan${color}) $stippled_hr${color}
Local IP: ${alignr}${color yellow}${addr wlan0}${color}
Public IP: ${alignr}${color yellow}${execi 1800 wget -q -O - checkip.dyndns.org | sed -e 's/[^[:digit:]\|.]//g'}${color}
Down ${color yellow}${downspeed wlan0}${color} k/s ${alignr}Up ${color yellow}${upspeed wlan0}${color} k/s
Total ${color yellow}${totaldown wlan0}${color} ${alignr}Total ${color yellow}${totalup wlan0}${color}
# |--PPP0
${else}${if_up ppp0}${voffset -13}
${color white}NETWORK (${color yellow}ppp${color}) $stippled_hr${color}
Local IP: ${alignr}${color yellow}${addr ppp0}${color}
Public IP: ${alignr}${color yellow}${execi 1800 wget -q -O - checkip.dyndns.org | sed -e 's/[^[:digit:]\|.]//g'}${color}
Down ${color yellow}${downspeed ppp0}${color} k/s ${alignr}Up ${color yellow}${upspeed ppp0}${color} k/s
Total ${color yellow}${totaldown ppp0}${color} ${alignr}Total ${color yellow}${totalup ppp0}${color}
# |--ETH0
${else}${if_up eth0}${voffset -13}
${color white}NETWORK (${color yellow}eth${color}) $stippled_hr${color}
Local IP: ${alignr}${color yellow}${addr eth0}${color}
Public IP: ${alignr}${color yellow}${execi 1800 wget -q -O - checkip.dyndns.org | sed -e 's/[^[:digit:]\|.]//g'}${color}
Down ${color yellow}${downspeed eth0}${color} k/s ${alignr}Up ${color yellow}${upspeed eth0}${color} k/s
Total ${color yellow}${totaldown eth0}${color} ${alignr}Total ${color yellow}${totalup eth0}${color}
${endif}${endif}${endif}

Still a long way to go...
