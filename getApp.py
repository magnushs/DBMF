import datetime
import mysql.connector

config = {
	'user': 'root',
	'password': '',
	'host': '127.0.0.1',
	'database': 'Calendar',
	'raise_on_warnings': True,
}
try:
	cnx=mysql.connector.connect(**config)
except mysql.connector.Error as err:
	if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
		print("Something is wrong with your username or passord")
	elif err.errno == errorcode.ER_BAD_DB_ERROR:
		print("Database does not exist")
	else:
		print(err)
cursor = cnx.cursor()

var = input("which attribute will you see: ")
query = ("SELECT username, status FROM  AppointmentBetween ")
print(var)

cursor.execute(query)

for (username, status) in cursor:
  print("{} is going to appointment".format(username, status))

cursor.close()
cnx.close()