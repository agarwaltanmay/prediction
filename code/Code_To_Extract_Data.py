import os

text_file = open(r'C:\Users\kapil\Desktop\ML assignment\weather2\Consolidated Data.txt', "a")
for month in range(1,13):
    for day in range(1,32):
        if((month in range(1,10)) and (day in range(1,10))):
            string = r'C:\Users\kapil\Desktop\ML assignment\weather2\Archive\ARC-2010-0'+str(month)+"-0"+str(day)+".txt"
            print("case1")
        elif((month in range(1,10)) and (day not in range(1,10))):
            string = r'C:\Users\kapil\Desktop\ML assignment\weather2\Archive\ARC-2010-0'+str(month)+"-"+str(day)+".txt"
            print("case2")
        elif((month not in range(1,10)) and (day in range(1,10))):
            string = r'C:\Users\kapil\Desktop\ML assignment\weather2\Archive\ARC-2010-'+str(month)+"-0"+str(day)+".txt"
            print("case3")
        else:
            string = r'C:\Users\kapil\Desktop\ML assignment\weather2\Archive\ARC-2010-'+str(month)+"-"+str(day)+".txt"
            print("case4")
        if(os.path.exists(string)):
            f = open(string,"r")
            for line in f:
                if '12:00' in line:        
                   text_file.write(line)
                   break
            f.close()
        else :
            text_file.write("")
            continue
text_file.close()
