org-clock-status-app
======

# A small box in status bar

It turns red when you do nothing.

![](visual_explanation.gif?raw=true)

# How it works

TODO: fix the link after release

Install the app to `~/Applications` and run it: https://github.com/koddo/OrgClockStatus/releases/download/0.1.0/OrgClockStatus.app.zip

It is controlled by AppleScript:

```
$ osascript -e 'tell application "org-clock-status" to clock in "some task"'
$ osascript -e 'tell application "org-clock-status" to clock out'
```

# Configure emacs and org-mode to use it

You can configure two keybindings for this in [BetterTouchTool](http://www.boastr.net/):

TODO: screenshot of bettertouchtool configuration

TODO: simple example and link to my .emacs.d


# Notes and todos

There is a checkbox to make it indicate the opposite: red when you work.

TODO: screenshot

I also use this checkbox to avoid closing the app when I don't want to track time, i.e. it's late at night, I'm tired and reading reddit.

```
$ osascript -e 'tell application "org-clock-status" to swap red and black'
now checked
$ osascript -e 'tell application "org-clock-status" to swap red and black'
now unchecked
```

For Mac OS X 10.7 and later.

TODO: maybe add a checkbox to run it at login time if anyone is interested



