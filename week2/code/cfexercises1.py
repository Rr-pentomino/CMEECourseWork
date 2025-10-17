#!/usr/bin/env python3
""" Some functions for practice """
__appname__ = "cfexercises1.py"
__author__ = 'Ahmet Selim Esmer (ase225@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"
__date__ = 'October 2025'

import sys

def foo_1(x=5):
    """ Returns the square root of x """
    return x ** 0.5

def foo_2(x=10, y=5):
    """ Returns the greater of x and y """
    if x > y:
        return x 
    return y 

def foo_3(x=2, y=4, z=6):
    """ Returns the sorted order of x, y, z """
    if x > y:
        x, y = y, x 
    if x > z:
        x, z = z, x 
    if y > z:
        y, z = z, y 
    return [x, y, z]

def foo_4(x=5):
    """ Returns the factorial of x """
    result = 1
    for i in range(1, x + 1):
        result = result * i 
    return result 

def foo_5(x=5):
    """ Returns the factorial of x """
    if x ==1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x=5):
    """ Returns the factorial of x """
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto 


def main(argv):
    print(foo_1(5))
    print(foo_2(10, 5))
    print(foo_3(2, 4, 6))
    print(foo_4(5))
    print(foo_5(5))
    print(foo_6(5))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)
