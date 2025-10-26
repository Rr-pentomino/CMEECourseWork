import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus'

      >>> is_an_oak('Quercus robur') 
      True
      >>> is_an_oak('Fagus sylvatica')
      False
      >>> is_an_oak('quercus petraea')
      True
      >>> is_an_oak('Acer pseudoplatanus')
      False
      >>> is_an_oak('QUERCUSS ILEX')
      True
    """
    name = name.strip().lower()
    return name.startswith('quercus') 

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../data/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    next(taxa)  # Skip header row 
    csvwrite.writerow(['Genus', 'Species']) 
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)
    
doctest.testmod() 
