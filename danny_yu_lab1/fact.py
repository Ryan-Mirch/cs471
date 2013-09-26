#!/usr/bin/python
#CS471 - Programming Language
#Section: 01
#Lab #1 due 9/1/13
#Author: Yu, Danny (dyu6)
#Date 8/29/13


def powerI (power, base):
    acc = 1
    for num in range (0, power):
        acc *= base
    return acc

#print "2^6 should be 64..."
#print powerI(6,2)
