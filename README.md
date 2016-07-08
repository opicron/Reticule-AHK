# Reticule-AHK
##Crosshair AHK script

Reticule uses an transparant overlay window to draw an crosshair over games running in fullscreen(*) or windowed mode. Think of the Mumble overlay with more functionality and less bulk.

Windowed mode crosshair overlay is undetectable and I have been running it for years now. The fullscreen crosshair overlay is achieved by injecting the overlay code (an mere direct3d image load) in the endscene of the direct3d application. The injecting of an overlay is detectable by the game client(*).

*\*Disclaimer: Custom crosshair overlays are allowed by most game developers. No resposibility is taken if your account is banned for using this script. I have been using this script for years and no issues have arrised so far.*

Imgur: http://imgur.com/a/HJBhH

### Features:
---------
- [x] fullscreen and windowed mode
- [x] multiple crosshairs included
- [x] opacity of crosshairs can be set (windowed mode only)
- [x] position of crosshairs can be adjusted per pixel
- [x] crosshairs can be switched on the fly
- [x] individual settings per crosshair!
- [x] only draws crosshair when game is in focus
- [x] system tray icon with context menu


### Installation:
-------------
1. Install AutoHotKey
2. Deploy Reticule
3. Edit recticule.ahk (follow instructions inside)
4. Run Reticule
5. Enjoy!


### Keys:
-----

Various hotkeys are implemented to adjust the crosshairs on the fly in-game. The modifier key listed below are combinations of the *windows function / windows start* ( <img src="http://i.imgur.com/jDaD7Mc.png" width="10"/> ) key

| Key | Description |
| :--- | :--- |
| <img src="http://i.imgur.com/jDaD7Mc.png" width="12"/> + page-up | set opacity (loops from 1 to 0.3) |
| <img src="http://i.imgur.com/jDaD7Mc.png" width="12"/> + end | loop through crosshairs in /gfx (PNG only) |
| <img src="http://i.imgur.com/jDaD7Mc.png" width="12"/> + home | save configuration |
| <img src="http://i.imgur.com/jDaD7Mc.png" width="12"/> + [arrowkeys] | move crosshair |


### Notes:
------
- reload the script after adding or renaming crosshairs!
- add your game window class to the script!

### Greetings:
---
Greetings in no particular order:

Big thanks to the ahk guys on the official AHK forums! Also worth mentioning the great people at the Hawken and Dirty Bomb forums, meraple, dieboard, zulaji, anders, thomaze, ran, rocket, soad, kopra, diox, memag, miscellaneous, pandabaron

Whoever i forgot, you know who you are ^^

