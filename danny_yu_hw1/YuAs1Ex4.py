#!/usr/bin/python

# YuAs1Ex4.py - Answer 8
# Author: Yu, Danny (dyu6)
# Date: 9/5/13

def ack(m, n):
    if m == 0:
        return n+1
    elif n == 0:
        return ack(m-1,1)
    else:
        return ack(m-1,ack(m,n-1))

#print ack(1,0)
#print ack(0,3)
#print ack(1,2)
#print ack(2,1)

#using trial and error for range...
for i in range (0, 8):
    ack(3, i)
    print i
