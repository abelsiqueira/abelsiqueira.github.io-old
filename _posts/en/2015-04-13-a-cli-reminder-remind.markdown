---
layout:     post
title:      A CLI Reminder - Remind
date:       2015-04-13
categories: public-utility
name:       remind
---
I've struggled with remembering appointments and tasks for a long time.
During my undergraduate courses, I learned to manage the tasks I had because
they were few and regular.
It's easy to remember you have class at 7h30 if every weekday you have class at
7h30. Also, you normally have a group of people around you doing the same
things, so someone usually remembers when something is due.

As years advanced, I started using what I could to remeber tasks. Mostly sending
e-mails to myself, setting alarms on my phone and using Google Agenda.
Well, I still send e-mails to myself, or mark e-mails as unread because it
annoys me to have unread messages, but I mostly use that for _read you later_
things, or things without time limit.
Also, I still use the phone alarm to remind myself that a class will start soon.
However, some things have a time frame, so using a calendar-type tool is
necessary, and I also needed a way to move things around.

I have tried Google Agenda,
[Trello](https://trello.com/abelsiqueira/recommend),
[Task Warrior](http://taskwarrior.org/), and
post-its on my computed screen.
Trello is a good for collaborative work, but is not open source. I used it
mainly to work in a group project.
Task Warrior is a good CLI tool, which I have installed, but there are too many
things to learn for it to be effective.
Post-its are not home-work shared.

Now I am trying another tool:
[remind](https://www.roaringpenguin.com/products/remind).
Remind is only a CLI tool that reads a file and prints what you want.
There are some GUI tools that use remind, but I like the CLI approach.
It has a calendar feature that prints by week, and lets you color appointments,
mark recurrent events, holidays, and so forth.
You can also print a printable version of your calendar (PS format), which is
nice, when you can predict a month (not my case yet).
The reasons I like remind are that it is a CLI tool, it's open source and you
edit a reminder file to use it.

To use it, first install according to your distribution, then create a
`reminders.rem` file. In this file, write your appointments, following a
specific format. For instance

    REM 13 Apr 2015 SPECIAL COLOR 255 0 0 Write about remind

This should be self-explanatory. Then, run

    remind reminders.rem

This should print your reminders for your current day. If it happens that today
isn't 13 Apr 2015 for you, then probably you'll have an empty output. Make the
appropriate changes and run again.
My preferred syntax is

    remind -ccu+3 reminders.rem

`-c` prints a calendar;
`-cc` prints a calendar in colors;
`-ccu` prints a calendar in colors with unicode chars;
`-ccu+3` print today plus 3 weeks of a calendar etc..

In my setup, I use [entr](http://entrproject.org/), and leave a workspace only
for remind. Whenever I update my remind file, the calendar is updated. Also, to
work from home, my remind file is inside my Dropbox, and I link it to my home
folder in each computer.
The full command I use is

    ls .reminders | entr sc -c "clear; remind -b1 -ccu+5 -w$COLUMNS .reminders \
    | head -n $LINES"
