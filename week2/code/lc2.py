# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.

rain_over_100 = [ n for n in rainfall
                 if n[1] > 100]

print(rain_over_100)
type(rain_over_100)


# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

rain_below_50 = [n[0] for n in rainfall
                 if n[1] < 50]
print (rain_below_50)
type (rain_below_50)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

rain_over_100_cl = []
for n in rainfall:
    if n[1] > 100:
        rain_over_100_cl.append(n)
print(rain_over_100_cl)
type(rain_over_100_cl)


rain_below_50_cl = []
for n in rainfall:
    if n[1] < 50:
        rain_below_50_cl.append(n[0])
print(rain_below_50_cl)
type(rain_below_50_cl)

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.