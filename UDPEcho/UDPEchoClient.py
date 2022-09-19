from socket import * 

s_ip = 'localhost'
s_port = 9999 # 서버와 똑같이 포트 
s_addr = ( s_ip, s_port )

c_sock = socket(AF_INET, SOCK_DGRAM)

indata = input('전송할 문자열 입력 : ')

c_sock.sendto(indata.encode('utf-8'), s_addr)
   
while True:
    if indata == 'q':
        break
    data, addr = c_sock.recvfrom(1024)
    print('Echoed data : ', data.decode('utf-8'))
    
    indata = input('전송할 문자열 입력 : ')
    c_sock.sendto(indata.encode('utf-8'), s_addr)


c_sock.close()
