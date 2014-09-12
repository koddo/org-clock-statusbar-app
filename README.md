org-clock-status-app
======

# A small box in status bar

It turns red when you do nothing.

![](visual_explanation.gif?raw=true)

Built for Mac OS X 10.8

# How it works

Install and run the app: https://github.com/koddo/OrgClockStatus/releases/download/0.1.0/OrgClockStatus.app.zip

It is controlled by AppleScript:

```
$ osascript -e 'tell application "org-clock-status" to clockin "some task"'
$ osascript -e 'tell application "org-clock-status" to clockout'
```

# Configure emacs and org-mode to use it

You can configure two keybindings for this in [BetterTouchTool](http://www.boastr.net/):

TODO: screenshot of bettertouchtool configuration

TODO: example and link to my .emacs.d


# Notes and todos


TODO: maybe add  the app to launch bar


