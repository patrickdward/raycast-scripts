#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set display resolution to max
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

use framework "Foundation"
use scripting additions

property pane_ids : {|AppleID|:2, |Family|:3, |Wi-Fi|:5, |Bluetooth|:6, |Network|:7, |Notifications|:9, |Sound|:10, |Focus|:11, |Screen Time|:12, |General|:14, |Appearance|:15, |Accessibility|:16, |Control Center|:17, |Siri & Spotlight|:18, |Privacy & Security|:19, |Desktop & Dock|:21, |Displays|:22, |Wallpaper|:23, |Screen Saver|:24, |Battery|:25, |Lock Screen|:27, |Touch ID & Password|:28, |Users & Groups|:29, |Passwords|:31, |Internet Accounts|:32, |Game Center|:33, |Wallet & ApplePay|:34, |Keyboard|:36, |Trackpad|:37, |Printers & Scanners|:38, |Java|:40}

on open_settings_to(settings_pane)
    set pane to current application's NSDictionary's dictionaryWithDictionary:pane_ids
    set pane_index to (pane's valueForKey:settings_pane) as anything
    set pane_index to pane_index - 1
    tell application "System Settings"
        activate
        delay 1
    end tell
    tell application "System Events"
        tell application process "System Settings"
            tell splitter group 1 of group 1 of window 1
                tell outline 1 of scroll area 1 of group 1
                    if name of static text of UI element 5 = "Wi‑Fi" then
                        select row pane_index
                    else
                        set pane_index to pane_index - 0
                        select row pane_index
                        
                    end if
                end tell
            end tell
        end tell
    end tell
end open_settings_to


on set_max_res()
    tell application "System Events"
        tell application process "System Settings"
            tell UI element 1 of group 1 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays"
                repeat until button 4 exists
                    delay 0
                end repeat
                tell button 4
                    click
                end tell
            end tell
        end tell
    end tell
end set_max_res

on run {}
    open_settings_to("Displays")
    set_max_res()
    quit application "System Settings"
end run
