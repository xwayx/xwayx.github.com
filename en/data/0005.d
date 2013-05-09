I prefer this method to change the new GDM theme.

To change the theme add gnome-appearance-properties to GDM's autostart applications:
[quote]sudo cp /usr/share/applications/gnome-appearance-properties.desktop /usr/share/gdm/autostart/LoginWindow/[/quote]
Log out. Select a new theme/wallpaper/font/icons/pointer. Log in and remove gnome-appearance-properties to GDM's autostart applications:
[quote]sudo rm /usr/share/gdm/autostart/LoginWindow/gnome-appearance-properties.desktop[/quote]