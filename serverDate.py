import socket
import re
import mysql.connector

mydb=mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="",
        database="test",)

while mydb.cursor().nextset():
                    pass
mycursor=mydb.cursor()


IP = socket.gethostbyname(socket.gethostname())
PORT = 4455
ADDR = (IP, PORT)
SIZE = 1024
FORMAT = "utf-8"


def main():

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    server.bind(ADDR)
    server.listen()
    while True:
        conn, addr = server.accept()
        data = conn.recv(SIZE).decode(FORMAT)
        vector=data.split("_",1)
        if vector[0] != '':
            if vector[0] == "1":
                SQL="INSERT INTO Analiza_Fisiere(Descriere) Values(%s);"
                values = (vector[1],)
            if vector[0] == "2":
                SQL="INSERT INTO Analiza_Tastatura(descriere) Values(%s);"
                values= (vector[1],)
            if vector[0] == "3":
                SQL="INSERT INTO Analiza_Istoric(descriere) Values(%s);"
                values= (vector[1],)
            if vector[0] == "4":
                SQL="INSERT INTO Analiza_Servicii(descriere) Values(%s);"
                values= (vector[1],)
            if vector[0] == "5":
                SQL="INSERT INTO logDNS(pachet) Values(%s);"
                values= (vector[1],)
            if vector[0] == "6":
                SQL="INSERT INTO logAdreseIP(ip) Values(%s);"
                values= (vector[1],)
            if vector[0] == "7":
                SQL="INSERT INTO logTrafic(pachete) Values(%s);"
                values= (vector[1],)
            mycursor.execute(SQL,values)
            mydb.commit()
        
        
    conn.close()

if __name__ == "__main__":
    main()
