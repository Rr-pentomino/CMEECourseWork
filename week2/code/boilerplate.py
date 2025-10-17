#!/usr/bin/env python3 

""" Boilerplate code for Python scripts """

__appname__ = "boilerplate.py"
__author__ = 'Ahmet Selim Esmer (ase225@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"
__date__ = 'October 2025'

import sys

def main(argv):
    """ Main entry point of the program """
    print('This is a boilerplate code')
    return 0

if (__name__ == "__main__"):
    """Make sure the main function is called from command line"""
    status = main(sys.argv)
    sys.exit(status)
