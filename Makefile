DEBUG =

BROWSERIFY = ./node_modules/.bin/browserify
WATCHIFY = ./node_modules/.bin/watchify -v
JADEIFY = ./node_modules/.bin/jade

love:
	@echo "Feel like makin' love."

pack:
	@file=$$(npm pack); echo "$$file"; tar tf "$$file"

publish:
	npm publish

tag:
	git tag "v$$(node -e 'console.log(require("./package").version)')"

clean:
	rm -f *.tgz
	rm -rf public
	npm prune --production

compile: \
	public/element-from-point.js \
	public/demo.html

autocompile:
	@\
	$(MAKE) public/element-from-point.js BROWSERIFY="$(WATCHIFY)" &\
	$(MAKE) -W doc/demo.jade public/demo.html JADEIFY="$(JADEIFY) --watch" &\
	wait

public:
	mkdir public

public/element-from-point.js: public
	@echo "Compiling $@…"
	@$(BROWSERIFY) \
		--entry ./ \
		--standalone elementFromPoint \
		--no-detect-globals \
		$(if $(DEBUG),--debug) \
		--outfile "$@"

public/%.html: doc/%.jade public
	@echo "Compiling $@…"
	@$(JADEIFY) --no-debug --pretty "$<" --out "$(@D)"

server: public
	cd public && python -m SimpleHTTPServer

.PHONY: love
.PHONY: pack publish tag
.PHONY: clean
.PHONY: compile autocompile
.PHONY: public/element-from-point.js
.PHONY: server
