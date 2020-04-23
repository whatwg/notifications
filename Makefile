SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy review

remote: notifications.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output notifications.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=warning \
	                       -F md-Text-Macro="COMMIT-SHA LOCAL COPY" \
	                       -F file=@notifications.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat notifications.html; echo ""; \
		rm -f notifications.html; \
		exit 22 \
	);

local: notifications.bs
	bikeshed spec notifications.bs notifications.html --md-Text-Macro="COMMIT-SHA LOCAL COPY"

deploy: notifications.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh

review: notifications.bs
	curl --remote-name --fail https://resources.whatwg.org/build/review.sh
	bash ./review.sh
