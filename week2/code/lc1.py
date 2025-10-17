birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

latin_names = [n[0] for n in birds]
print (latin_names)
type (latin_names)

common_names = [n[1] for n in birds]
print(common_names)
type(common_names)

mean_bodymass = [n[2] for n in birds]
print(mean_bodymass)
type(mean_bodymass)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

latin_names_cl = []
for n in birds:
    latin_names_cl.append(n[0])
print(latin_names_cl)
type(latin_names_cl)


common_names_cl = []
for n in birds:
    common_names_cl.append(n[1])
print(common_names_cl)
type(common_names_cl)


mean_bodymass_cl = []
for n in birds:
    mean_bodymass_cl.append(n[2])
print(mean_bodymass_cl)
type(mean_bodymass_cl)
