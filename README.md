# Reticule-AHK
##Crosshair AHK script

Reticule uses an transparant overlay window to draw an crosshair over games running in fullscreen windowed mode(!). Think of the Muble overlay with more functionality and less bulk.

It is not possible for this script, now nor in the future, to draw over games running fullscreen mode.

*Disclaimer: Custom crosshair overlays are allowed by most game developers. No resposibility is taken if your account is banned for using this script.*

### Features:
---------
- [x] multiple crosshairs included
- [x] opacity of crosshairs can be set
- [x] position of crosshairs can be adjusted per pixel
- [x] crosshairs can be switched on the fly
- [x] individual settings per crosshair!
- [x] only draws crosshair when game is in focus
- [x] system tray icon with context menu


### Installation:
-------------
1 Install AutoHotKey
2 Edit recticule.ahk (follow instructions inside)
3 Enjoy!


### Keys:
-----
###### [windowskey] + page-up      
set opacity (loops from 1 to 0.5)
 
###### [windowskey] + end          
loop through crosshairs in /gfx (PNG only)

###### [windowskey] + home         
save configuration

###### [windowskey] + [arrowkeys]  
move crosshair


### Notes:
------
- reload the script after adding or renaming crosshairs!
- add your game window class to the script else it will not show!


