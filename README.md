Smartswitch
===========

A thing to make switching applications on a Mac easier.

![smartswitch](http://i.imgur.com/XBrF3p8.jpg)

Why
---

I find it really frustrating to realize what window I'm in on a Mac,
especially when I'm using multiple windows. I also think switching is,
by default, pretty subpar. This allows me (and you) to switch applications
confidently.

How to Use
----------

1) Install [Hammerspoon](http://www.hammerspoon.org/)
2) Add the following to your `~/.hammerspoon/init.lua`:
    require "smartswitch"
    hs.hotkey.bind({"cmd", "alt"}, "tab", smartswitch)
You can, of course, choose your own hotkeys. Haven't figured out if its possible to have Hammerspoon binds shadow normal binds (i.e. replace Cmd+Tab).
3) Copy or link `smartswitch.lua` from this repository to `~/.hammerspoon`

You're done! Go switch with confidence!

TODO
----

- Cancel with escape
- Allow more than eight windows (probably not though)
- Make it not look terrible
