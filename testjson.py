import urllib, json
#url = "http://www.masslottery.com/games/lottery/search/results-lottery.html?game_id=12&mode=1&year=2017&month=8&x=12&y=14"
#url = "http://www.masslottery.com/data/json/search/lotterygames/12/201708.json?_=1503079479105"
url = "http://www.masslottery.com/data/json/search/lotterygames/12/201708.json"

response = urllib.urlopen(url)
data = json.loads(response.read())
print data
