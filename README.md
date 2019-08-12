org-clock-statusbar-app
======

# Intro

A small box in status bar. It turns red when you do nothing.

![](img/intro.png?raw=true)

I use org-mode to track my time. I used to forget to clock in and `org-clock-statusbar.app` eliminated this problem. It also helps a bit against procrastination, hurrying me with the reddest color my monitor can display.

You can watch an [intro gif](img/intro.gif?raw=true).


# Setup

Install the app to `~/Applications` and run it.

https://github.com/koddo/org-clock-statusbar-app/releases/download/1.0.1/org-clock-statusbar.app.zip

Add these lines to your dotemacs:

```emacs-lisp
(add-hook 'org-clock-in-hook (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat "tell application \"org-clock-statusbar\" to clock in \"" (replace-regexp-in-string "\"" "\\\\\"" org-clock-current-task) "\""))))
(add-hook 'org-clock-out-hook (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e" "tell application \"org-clock-statusbar\" to clock out")))
```

Then track your time as usual.


# Notes and todos

There is a checkbox to make it indicate the opposite: red when you work.

![](img/swap_red_and_black.png?raw=true)

I also use this checkbox to avoid closing the app when I don't want to track time, i.e. it's late at night, I'm tired and reading reddit. Update: I no longer use the checkbox this way, I clock in a procractination task instead.

The app is controlled by AppleScript:

```
$ osascript -e 'tell application "org-clock-statusbar" to clock in "some task"'
$ osascript -e 'tell application "org-clock-statusbar" to clock out'
$ osascript -e 'tell application "org-clock-statusbar" to swap red and black'
now checked
```

You can build it yourself using Xcode 5:

```
$ xcodebuild -configuration Release
$ cp -r build/Release/org-clock-statusbar.app ~/Applications/
```

For Mac OS X 10.8 and later.

There is an alternative written in MacRuby: https://github.com/jordonbiondo/osx-org-clock-menubar

In Gnome you can use [short-memo](https://github.com/kusabashira/short-memo) extension with some configuration: <https://www.reddit.com/r/orgmode/comments/8keyke/tip_org_clock_on_desktop_gnome_topbar/>

TODO: maybe add a checkbox to run it at login time if anyone is interested

I have some global bettertouchtools keybindings for this app, see readme for my [dotemacs](https://github.com/koddo/.emacs.d).
