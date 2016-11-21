local: notifications.bs
	bikeshed

remote: notifications.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@notifications.bs > notifications.html
