local: notifications.bs
	bikeshed notifications.bs notifications.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: notifications.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@notifications.bs > notifications.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: notifications.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh && bash ./deploy.sh
