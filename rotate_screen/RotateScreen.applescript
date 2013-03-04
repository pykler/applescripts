--
-- Script to configure second dell monitor quickly
--

-- Set Desktop Pic on second monitor

set desktopList to {}
set desktopBG to null
tell application "System Events"
	set desktopList to a reference to every desktop
	set desktopBG to picture of item 1 of desktopList
	set picture of item 2 of desktopList to desktopBG -- display 2
end tell

-- Rotate the screen

-- Get the name of the second Monitor

-- set targetDisplay to "DELL 1907FP"
tell application "System Events"
	set desktopList to a reference to every desktop
	try
		-- This might not exist
		set targetDisplay to display name of item 2 of desktopList
	on error
		beep 2
		return
	end try
end tell

set targetRot to "90¡"
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.displays"
	tell application "System Events"
		tell process "System Preferences"
			tell window targetDisplay
				-- get the old value
				set oldval to value of pop up button "Rotation:" of tab group 1
				if oldval is not equal to targetRot then
					-- select the button, or it won't take a menu click
					click pop up button "Rotation:" of tab group 1
					click menu item targetRot of menu of pop up button "Rotation:" of tab group 1
					-- It takes a little while for confirm dialog to pop up
					delay 2
					click button "Confirm" of sheet 1
				end if
			end tell
		end tell
	end tell
end tell

tell application "System Preferences"
	quit -- that seems to be the safest starting point
end tell