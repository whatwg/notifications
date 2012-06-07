ANOLIS = anolis

all: Overview.html data/xrefs/dom/notifications.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --w3c-compat --omit-optional-tags --quote-attr-values \
	--enable=xspecxref --enable=refs \
	--filter=".publish" $< $@

data/xrefs/dom/notifications.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

publish: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="notifications" \
	--filter=".dontpublish" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR.html
