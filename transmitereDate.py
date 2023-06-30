import socket
import subprocess

IP = socket.gethostbyname(socket.gethostname())
PORT = 4455
ADDR = (IP, PORT)
FORMAT = "utf-8"
SIZE = 1024




def main():   
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(ADDR)
    file1=open("logActivitati.txt","r")
    file2=open("logTaste.txt","r")
    file3=open("istoricComenzi.txt","r")
    file4=open("logServicii.txt","r")
    file5=open("logDNS.txt","r")
    file6=open("logAdreseIP.txt","r")
    file7=open("logTrafic.txt","r")

    for data in file1:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="1_"+data
        client.send(data.encode(FORMAT))

    for data in file2:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="2_"+data
        client.send(data.encode(FORMAT))

    for data in file3:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="3_"+data
        client.send(data.encode(FORMAT))

    for data in file4:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="4_"+data
        client.send(data.encode(FORMAT))

    for data in file5:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="5_"+data
        client.send(data.encode(FORMAT))
    
    for data in file6:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="6_"+data
        client.send(data.encode(FORMAT))

    for data in file7:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect(ADDR)    
        data="7_"+data
        client.send(data.encode(FORMAT))

    file5.close()
    file6.close()
    file7.close()
    file4.close()
    file3.close()
    file1.close()
    file2.close()
    curata1=open("logTrafic.txt", "w")
    curata1.write("")
    curata1.close()
    client.close()

if __name__ == "__main__":
    main()
