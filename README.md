OrgClockStatus.app
======

For Mac OS X 10.8 or later.

# A small square in status bar

It turns red when you do nothing.

![](visual_explanation.gif?raw=true)

# How to try

https://github.com/koddo/OrgClockStatus/releases/download/0.1.0/OrgClockStatus.app.zip

```
$ osascript -e 'tell application "OrgClockStatus" to clockin "some task"'
$ osascript -e 'tell application "OrgClockStatus" to clockout'
```

You can configure two keybindings for this in [BetterTouchTool](http://www.boastr.net/) or in Emacs itself.

TODO: example and link to my .emacs.d

# Notes and todos

The first fully working version, except it has no settings.
It would be great to let users change icons or just reverse logic when the square turns red when you work. 
