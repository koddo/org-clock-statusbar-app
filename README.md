org-clock-status-app
======

# Intro

A small box in status bar. It turns red when you do nothing.

![](intro.png?raw=true)

I use org-mode to track my time. I used to forget to clock in and this tiny app solves the issue. It also helps a bit against procrastination hurrying me with the reddest color my monitor can display.

You can watch an [intro gif](intro.gif?raw=true).


# Set up

Install the app to `~/Applications` and run it. You can also built it yourselt, see notes.

https://github.com/koddo/org-clock-status-app/releases/download/1.0/org-clock-status.app.zip

Put these lines to your dotemacs.

```lisp
(defadvice org-clock-in (after org-clock-status-app-in activate)
  "Tell org-clock-status.app to clock in."
  (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat "tell application \"org-clock-status\" to clock in \"" org-clock-current-task "\"")))
(defadvice org-clock-out (after org-clock-status-app-out activate)
  "Tell org-clock-status.app to clock out."
  (call-process "/usr/bin/osascript" nil 0 nil "-e" "tell application \"org-clock-status\" to clock out"))
```

Then track your time as usual.


# Notes and todos

There is a checkbox to make it indicate the opposite: red when you work.

![](swap_red_and_black.png?raw=true)

I also use this checkbox to avoid closing the app when I don't want to track time, i.e. it's late at night, I'm tired and reading reddit.

It is controlled by AppleScript:

```
$ osascript -e 'tell application "org-clock-status" to clock in "some task"'
$ osascript -e 'tell application "org-clock-status" to clock out'
$ osascript -e 'tell application "org-clock-status" to swap red and black'
now checked
```

You can build it yourself using Xcode 5:

```
$ xcodebuild -configuration Release
```

For Mac OS X 10.8 and later.

TODO: maybe add a checkbox to run it at login time if anyone is interested



