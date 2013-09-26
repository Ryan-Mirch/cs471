#!/usr/bin/python

#YuAs1Ex1.py - Answer 1
#Author - Yu, Danny (dyu6)
#Date - 9/5/13

def powerR(pow, base):
    if pow == 0:
        return 1
    else:
        return base * powerR(pow-1, base)

#print powerR(6,2)
