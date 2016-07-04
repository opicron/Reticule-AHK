# Reticule-AHK
====================
Crosshair AHK script
====================

Reticule draws an crosshair over an fullscreen windowed mode(!) display. 

It is not possible for this script, now nor in the future, to draw over fullscreen mode games.

Custom crosshair overlays are allowed by most game developers. However I take no resposibility if your account is banned for using this script.

*Note that Mumble crosshair overlay works in the same fashion as this script.

---------
Features:
---------
- multiple crosshairs included
- opacity of crosshairs can be set
- position of crosshairs can be adjusted per pixel
- crosshairs can be switched on the fly
- individual settings per crosshair!
- only draws crosshair when game is in focus
- system tray icon with context menu

-------------
Installation:
-------------
- Install AutoHotKey
- Edit recticule.ahk and add or uncomment the game window class in the top configuration area (some examples included). Keep an eye on the numbering of the variables!
- Enjoy!

-----
Keys:
-----
- [windowskey] + page-up      
set opacity (loops from 1 to 0.5)
- [windowskey] + end          
loop through crosshairs in /gfx (PNG only)
- [windowskey] + home         
save configuration
- [windowskey] + [arrowkeys]  
move crosshair

------
Notes:
------
- reload the script after adding or renaming crosshairs!
- add your game window class to the script else it will not show!


