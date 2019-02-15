#!/usr/bin/python
#import mysql.connector
import MySQLdb
import csv


def connect():
    global conn
    """ Connect to MySQL database """
    try:
        conn = MySQLdb.connect(host='mysql.cce6lk0tj9ey.us-east-1.rds.amazonaws.com',    # your host, usually localhost
                     user='admin',         # your username
                     passwd='admin123',  # your password
                     db='roninDB')        # name of the data base

#        if conn.is_connected():
        print('Connected to MySQL database')
 
    except ValueError as e:
        print(e)
 
#    finally:
#        conn.close()

def disconnect():
    conn.close()

def insertdata():

    ## Use all the SQL you like
    #cur.execute("SELECT * FROM YOUR_TABLE_NAME")

    ## print all the first cell of all the rows
    #for row in cur.fetchall():
    #    print row[0]

    try:
        # you must create a Cursor object. It will let
        #  you execute all the queries you need
        cur = conn.cursor()
        with open('resulttestjason.txt', 'rb') as csvfile:
            csvreader = csv.reader(csvfile, delimiter=';')
            for row in csvreader:
                if row[0]:
                    print("%s %s %s %s %s %s %s"%(row[0],row[1],row[2],row[3],row[4],row[5],row[6]))
                    cur.execute("""SELECT * FROM  masscash""")
                    result=cur.fetchall()
                    print result
                    cur.execute("""INSERT INTO masscash VALUES (%s,%s,%s,%s,%s,%s,%s)""",((row[0]),row[1],row[2],row[3],row[4],row[5],row[6]))
                    result=cur.fetchall()
                    print result
    except:
        conn.rollback()

    finally:
        conn.commit()

if __name__ == '__main__':
    connect()
    insertdata()
    disconnect()
