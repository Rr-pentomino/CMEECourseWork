def buggyfunc(x):
    y = x 
    for i in range(x):
        try:
            y = y - 1
            z = x / y
        except ZeroDivisionError:
            print(f"the reslt of dividing a number by zero is undefined")
        except:
            print(f"this did not work; {x= }; {y= }")
        else:
            print(f"OK; {x= }; {y= }; {z= };")
    return z

buggyfunc(20)