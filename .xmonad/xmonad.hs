import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO
import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import Data.Ratio ((%))
import XMonad.Layout.Grid
import XMonad.Util.Scratchpad
import qualified XMonad.StackSet as W

-- XMonad
main = do
    dzen <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { manageHook              = manageDocks <+> manageHook defaultConfig <+> manageScratchPad
        , layoutHook              = myLayoutHook
        , logHook                 = dynamicLogWithPP $ myDzenPP dzen

        , terminal                = myTerminal
        , workspaces              = myWorkspaces

        , focusFollowsMouse       = False
        , focusedBorderColor      = "#0066ff"
        , borderWidth             = 2
        , modMask                 = mod4Mask
        , normalBorderColor       = "#000"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_s), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask, xK_s), spawn "scrot")
        , ((mod4Mask, xK_u), scratchpadSpawnActionTerminal "urxvtc")
        , ((mod4Mask, xK_e), spawn "urxvtc -e 'vim'")
        , ((0, 0x1008ff13), spawn "amixer -q sset Master 5+")
        , ((0, 0x1008ff11), spawn "amixer -q sset Master 5-")
        ]

myStatusBar   = "dzen2 -fn 'standard 07_57 caps-6' -bg '#000000' -fg '#a0a0a0' -h 14 -ta l -w 780"
myTerminal    = "urxvtc"

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
    , ppHidden  = pad . noScratchPad
    , ppOutput  = hPutStrLn h
    , ppUrgent  = pad
    , ppWsSep   = ""
    , ppLayout  = dzenColor "#b7e234" ""
    }
    where
        noScratchPad ws = if ws == "NSP" then "" else ws

myLayoutHook      = smartBorders $ avoidStruts $ tiled ||| Mirror tiled ||| Full ||| gridIM
    where
        tiled     = Tall nmaster delta ratio
        nmaster   = 1
        ratio     = 14/25
        delta     = 3/100
        gridIM    = withIM (1%7) (Or (Role "MainWindow") (Role "buddy_list")) Grid

manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
    where
        h        = 0.50   -- terminal height, 50%
        w        = 0.50   -- terminal width, 50%
        t        = 0.25   -- distance from top edge, 90%
        l        = 0.25   -- distance from left edge, 0%
