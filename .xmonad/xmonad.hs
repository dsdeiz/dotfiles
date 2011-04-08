import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO

-- XMonad
main = do
    dzen <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { manageHook              = manageDocks <+> manageHook defaultConfig
        , layoutHook              = avoidStruts $ layoutHook defaultConfig
        , logHook                 = dynamicLogWithPP $ myDzenPP dzen

        , workspaces              = myWorkspaces
        , terminal                = myTerminal

        , focusedBorderColor      = "#0066ff"
        , modMask                 = mod4Mask
        , normalBorderColor       = "#000"
        }

myStatusBar   = "dzen2 -fn 'Terminus-9' -bg '#000000' -fg '#a0a0a0' -h 14 -ta l -w 846"
myTerminal    = "urxvt"

myWorkspaces  = 
    [ wrapBitmap "xbm8x8/fox.xbm"
    , wrapBitmap "xbm8x8/bug_02.xbm"
    , wrapBitmap "xbm8x8/dish.xbm"
    , wrapBitmap "xbm8x8/fs_02.xbm"
    , wrapBitmap "xbm8x8/scorpio.xbm"
    , wrapBitmap "xbm8x8/shroom.xbm"
    , wrapBitmap "xbm8x8/usb.xbm"
    , wrapBitmap "xbm8x8/cat.xbm"
    , wrapBitmap "xbm8x8/diskette.xbm"
    ]
    where
        wrapBitmap bitmap = "^i(/home/arnold/.dzen/" ++ bitmap ++ ")"

myDzenPP h      = defaultPP
    { ppCurrent = dzenColor "#ffaf5f" "" . pad
    , ppHidden  = pad
    , ppOutput  = hPutStrLn h
    , ppUrgent  = pad
    , ppWsSep   = ""
    }
