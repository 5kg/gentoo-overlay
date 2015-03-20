all:
	gcc -Wl,-soname,libnolock.so.0 -fPIC -shared -ldl -Wall -o libnolock.so.0 nolock.c
	ln -s libnolock.so.0 libnolock.so
