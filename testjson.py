import string
import urllib, json
# MassCash - start date: March 1991

#print("id;date;n1;n2;n3;n4;n5")
for year in xrange(1991,2018):
    for month in xrange(1,12):
        drawdate=str(year)+str(month).zfill(2)
        url = "http://www.masslottery.com/data/json/search/lotterygames/12/"+drawdate+".json"
#        print url

#url = "http://www.masslottery.com/games/lottery/search/results-lottery.html?game_id=12&mode=1&year=2017&month=8&x=12&y=14"
#url = "http://www.masslottery.com/data/json/search/lotterygames/12/201708.json?_=1503079479105"
#url = "http://www.masslottery.com/data/json/search/lotterygames/12/201708.json"
        try:
            response = urllib.urlopen(url)
            data = json.loads(response.read())
            min = int(data['min'])
            max = int(data['max'])
            range = int(max-min)
            for element in data['draws']:
                print("%s;%s;%s"%(element['draw_id'],element['draw_date'],string.replace(element['winning_num'],'-',';')))
        except ValueError:
#            print("No draws on %s"%(drawdate))
            print(";;;;;;")




