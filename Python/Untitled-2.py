# Given the log of a Web Server, please write a function that 
# returns the min/max time of page visited from the same IP address


List = open("filename.txt").readlines()
ip_address = int(input("what is the ipaddress of the you want to check its log time": ))

def log_times(ip_address):
    log_time = 0
    for i in List:
        if address == ip_address:
            log_time += 1
    return log_time

print(log_times(ip_address))

List.close()

#####################

uniq -c logfile.txt | awk '{print $2": "$1}'

#####################

#!/usr/bin/python2

infile = open("file.txt","r")
iplist = {}  # create an empty dict

for line in infile:
    line = line.strip()   # remove newline.
    if line: # if not a blank line.
        iplist.setdefault(line, 0) # check for ip and add with default value of 0
        iplist[line] += 1 # increment

outfile = open("out.txt","w") #open output file

for key in iplist.keys():
    line = "%-15s = %s" % (key, iplist[key])
    print line   # print uf desired.
    outfile.write(line + "\n")

#############################
def CalculateApacheIpHits(logfile_pathname):
    # Make a dictionary to store IP addresses and their hit counts
    # and read the contents of the log file line by line
    IpHitListing = {}
    Contents = open(logfile_pathname, "r").xreadlines(  )
    # You can use .readlines in old Python, but if the log is huge...

    # Go through each line of the logfile
    for line in Contents:
        # Split the string to isolate the IP address
        Ip = line.split(" ")[0]

        # Ensure length of the IP address is proper (see discussion)
        if 6 < len(Ip) <= 15:
            # Increase by 1 if IP exists; else set hit count = 1
            IpHitListing[Ip] = IpHitListing.get(Ip, 0) + 1

    return IpHitListing