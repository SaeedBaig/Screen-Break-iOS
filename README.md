# Screen-Break-iOS
An app that periodically reminds you to take a break from the screen according to the 20-20 rule (every 20 minutes, look away for 20 seconds)

This app is currently under construction.

## Planned features
- Send notification every 20 minutes telling user to look away from screen, then another one 20 seconds later saying they can look back
- Allow user to customise interval & break time to something other than 20 minutes & 20 seconds
- Have longer breaks (e.g. 5 minute break every hour); also customisable 
- Take into account when the user is actually looking and not looking at screen (i.e. screen off), so you only send a notification after 20 minutes of screen time

## Approches to achieve desired functionality
- Find a way to run app in background, and only send notification once timer hits 0
- Send notification every X minutes, and find a way to cancel notification when screen locked
 
Bigger problem is how to detect (and act) on whether the screen is on or off. Ideas are:
- Find a way to detect if screen is on or off (hard)
- Find a way to read screen brightness; act if screen brightness = 0 (sounds more doable)
- See if you can read the Screen Time info in iOS 12+ to determine when screen time is stagnant
- Find a way to detect when access to app-files becomes restricted (apparently happens when device locked)
