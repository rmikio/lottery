#Importing modules
import json
import urllib2

# Open the URL and the screen name
url = "http://www.masslottery.com/data/json/search/lotterygames/12/201708.json"

# This takes a python object and dumps it to a string which is a JSON representation of that object
data = json.load(urllib2.urlopen(url))

#print the result
print data
