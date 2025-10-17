#!/usr/bin/env python3
""" Simple example of a sequence alignment algorithm """
__appname__ = "align_seqs.py"
__author__ = 'Ahmet Selim Esmer (ase225@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


import sys # module to interface our program with the operating system

def run_all():
# First 2 lines of the file are the sequences to be aligned
    with open("../data/seq1.txt", "r") as f:
        lines = f.readlines()
    seq1 = lines[0].strip() if len(lines) > 0 else ""  
    seq2 = lines[1].strip() if len(lines) > 1 else ""

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

    l1 = len(seq1)
    l2 = len(seq2)
    if l1 >= l2:
        s1 = seq1
        s2 = seq2
    else:
        s1 = seq2
        s2 = seq1
        l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
    def calculate_score(s1, s2, l1, l2, startpoint):
        matched = "" # to hold string displaying alignements
        score = 0
        for i in range(l2):
            if (i + startpoint) < l1:
                if s1[i + startpoint] == s2[i]: # if the bases match
                    matched = matched + "*"
                    score = score + 1
                else:
                    matched = matched + "-"

    # some formatted output
        print("." * startpoint + matched)           
        print("." * startpoint + s2)
        print(s1)
        print(score) 
        print(" ")

        return score


# now try to find the best match (highest score) for the two sequences
    my_best_align = None
    my_best_score = -1

    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > my_best_score:
            my_best_align = "." * i + s2 # think about what this is doing!
            my_best_score = z 
    print(my_best_align)
    print(s1)
    print("Best score:", my_best_score)


# Save the best alignment and score to a .txt file
    with open("../results/align_results.txt", "w") as f:
        f.write(my_best_align + "\n" + s1 + "\n" + "Best score: " + str(my_best_score) + "\n")

def main(argv):
    """ Main entry point of the program """
    return run_all()

if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)



