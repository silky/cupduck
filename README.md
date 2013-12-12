cupduck
==

what am i currently doing? cupduck can tell you!


about
==

tracks what I am currently working on, in real time only (no history at the
moment) by using Taskwarrior, Dropbox, and Heroku.

this source the source for the Webserver (using Snap in Haskell) and a python
script that automates the updating of the database.


how does it work?
==

upon each invocation of task, it will consider updating a file that is placed
in dropbox's public folder. This is what the Haskell app reads, and displays.
