from socket import * 

s_ip = 'localhost'
s_port = 9999

s_sock = socket(AF_INET, SOCK_DGRAM)
s_sock.bind( (s_ip, s_port) )

s_sock.settimeout(5)

data, c_addr = s_sock.recvfrom(1024)

print('수신자는 어디 : ', c_addr)
print('수신된 자료는 : ', data.decode(utf-8))

s_sock.close()