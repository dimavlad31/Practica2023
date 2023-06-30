import socket
import subprocess
import os

IP = socket.gethostbyname(socket.gethostname())
PORT = 4455
ADDR = (IP, PORT)
FORMAT = "utf-8"
SIZE = 1024




def main():   
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(ADDR)
    if os.path.exists("logActivitati.txt"):
        file1=open("logActivitati.txt","r")
        for data in file1:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="1_"+data
            client.send(data.encode(FORMAT))
        file1.close()

    if os.path.exists("logTaste.txt"):
        file2=open("logTaste.txt","r")
        for data in file2:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="2_"+data
            client.send(data.encode(FORMAT))
        file2.close()

    if os.path.exists("istoricComenzi.txt"):
        file3=open("istoricComenzi.txt","r")
        for data in file3:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="3_"+data
            client.send(data.encode(FORMAT))
        file3.close()

    if os.path.exists("logServicii.txt"):
        file4=open("logServicii.txt","r")
        for data in file4:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="4_"+data
            client.send(data.encode(FORMAT))
        file4.close()

    if os.path.exists("logDNS.txt"):
        file5=open("logDNS.txt","r")
        for data in file5:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="5_"+data
            client.send(data.encode(FORMAT))
        file5.close()

    if os.path.exists("logAdreseIP.txt"):
        file6=open("logAdreseIP.txt","r")
        for data in file6:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="6_"+data
            client.send(data.encode(FORMAT))
        file6.close()

    if os.path.exists("logTrafic.txt"):
        file7=open("logTrafic.txt","r")
        for data in file7:
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client.connect(ADDR)    
            data="7_"+data
            client.send(data.encode(FORMAT))
        file7.close()
        
    client.close()

if __name__ == "__main__":
    main()
