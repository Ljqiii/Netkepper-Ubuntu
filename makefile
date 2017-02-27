getusername.out: main.c
	gcc main.c -lcrypto -o getusername.out
	chmod +x connect.sh
