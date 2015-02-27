all: notifications.html

notifications.html: notifications.bs Makefile
	bikeshed spec
