#!/usr/bin/env python3
# File: using_name.py

if __name__ == "__main__":
    print("This script is being run directly")
else:
    print("I am being imported from another module")

print("This module's name is: " +__name__)
