#!usr/bin/env python3

import sys

def foo_1(x=5):
    return x ** 0.5

def foo_2(x=10, y=5):
    if x > y:
        return x 
    return y 

def foo_3(x=2, y=4, z=6):
    if x > y:
        x, y = y, x 
    if x > z:
        x, z = z, x 
    if y > z:
        y, z = z, y 
    return [x, y, z]

def foo_4(x=5):
    result = 1
    for i in range(1, x + 1):
        result = result * i 
    return result 

def foo_5(x=5):
    if x ==1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x=5):
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto 


def main(argv):
    print(foo_1(5))
    print(foo_2(5))
    print(foo_3(5, 4))
    print(foo_4(5))
    print(foo_5(5))
    print(foo_6(5))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)
