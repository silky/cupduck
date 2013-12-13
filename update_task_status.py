#!/usr/bin/env python
# coding: utf-8


"""
    Queries task warrior and will write my list of active tasks to
    the specified file.
"""

from __future__ import print_function
from taskw import TaskWarrior
import time

logfile = "/home/noon/Dropbox/Public/taskwarrior.txt"

def write_log (active):
    with open(logfile, "w") as f:
        if not active or len(active) == 0:
            print("unknown", file=f)
            return

        # otherwise, print everything
        for (p, d) in active:
            print("%s, %s" % (p, d), file=f)

if __name__ == "__main__":
    w = TaskWarrior()
    tasks = w.load_tasks()['pending']

    def display_time (epoch):
        return time.strftime("%a %d %b %Y, %I:%M:%S %p", time.localtime(float(epoch)))

    def maybe_proj (t):
        if 'project' in t:
            return t['project']
        else:
            return 'something'

    active = [ (maybe_proj(t), display_time(t['start'])) for t in tasks if 'start' in t ]
    write_log(active)
