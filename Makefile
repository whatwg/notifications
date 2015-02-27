all: notifications.html

notifications.html: notifications.bs Makefile
	curl -s https://api.csswg.org/bikeshed/ -F file=@notifications.bs > notifications.html
