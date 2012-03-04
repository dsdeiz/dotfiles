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
import qualified XMonad.StackSet as W
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.NamedScratchpad
import XMonad.Layout.SimpleFloat

-- XMonad
main = do
    dzen <- spawnPipe myStatusBar
    xmonad $ defaultConfig
        { manageHook              = manageDocks <+> manageHook defaultConfig <+> namedScratchpadManageHook myScratchPads
        , layoutHook              = myLayoutHook
        , logHook                 = dynamicLogWithPP $ myDzenPP dzen

        , terminal                = myTerminal
        , workspaces              = myWorkspaces

        , focusFollowsMouse       = False
        , focusedBorderColor      = "#d5156c"
        , borderWidth             = 2
        , modMask                 = mod4Mask
        , normalBorderColor       = "#000"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_s), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask, xK_s), spawn "scrot")
        , ((mod4Mask, xK_i), namedScratchpadAction myScratchPads "htop")
        , ((mod4Mask, xK_u), namedScratchpadAction myScratchPads "terminal")
        , ((mod4Mask .|. shiftMask, xK_u), namedScratchpadAction myScratchPads "scratchpad")
        , ((mod4Mask, xK_e), spawn "urxvtc -e vim")
        , ((mod4Mask .|. shiftMask, xK_p), shellPrompt myXPConfig)
        , ((0, 0x1008ff13), spawn "amixer -q sset Master 5+")
        , ((0, 0x1008ff11), spawn "amixer -q sset Master 5-")
        ]

myStatusBar   = "dzen2 -fn 'bitocra' -bg '#101010' -fg '#a0a0a0' -h 18 -ta l -w 780 -y 1366"
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

myLayoutHook      = smartBorders $ avoidStruts $ tiled ||| Mirror tiled ||| Full ||| gridIM ||| simpleFloat
    where
        tiled     = Tall nmaster delta ratio
        nmaster   = 1
        ratio     = 14/25
        delta     = 3/100
        gridIM    = withIM (1%7) (Or (Role "MainWindow") (Role "buddy_list")) Grid

myXPConfig = defaultXPConfig
    { fgColor   = "#FFFFFF"
    , bgColor  = "#000000"
    , bgHLight = "cyan"
    , fgHLight = "#FFFFFF"
    , font     = "xft:bitocra"
    }

myScratchPads =
    [ NS "scratchpad" "urxvtc -name scratchpad" (resource =? "scratchpad") (customFloating $ W.RationalRect 0 0 1 0.3)
    , NS "terminal" "urxvtc -name terminal" (resource =? "terminal") (customFloating $ W.RationalRect 0 0.5 1 0.5)
    , NS "htop" "urxvtc -name htop -e htop" (resource =? "htop") (customFloating $ W.RationalRect 0.25 0.25 0.5 0.5)
    ]
