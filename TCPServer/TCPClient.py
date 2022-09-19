from socket import *

s_ip = 'localhost'
s_port = 12345

c_sock = socket(AF_INET, SOCK_STREAM)

c_sock.connect( (s_ip, s_port) )

print(c_sock.recv(1024).decode('utf-8'))
c_sock.close()