local: notifications.bs
	bikeshed spec notifications.bs notifications.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: notifications.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@notifications.bs > notifications.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: notifications.bs
	curl --remote-name --fail https://raw.githubusercontent.com/whatwg/common-build/master/deploy.sh && bash ./deploy.sh
