JQ = jq
TREE_SITTER = node_modules/.bin/tree-sitter

.PHONY: help
help:
	@echo 'Make targets:'
	@echo '  generate   - generate parser sources'
	@echo '  clean      - remove build directory and intermediate files'
	@echo '  tests      - run all tests'
	@echo '  fetch-examples - fetch example repositories'
	@echo '  parse-examples - parse example files'

.PHONY: generate
generate:
	$(MAKE) src/typescript-scanner.h
	$(TREE_SITTER) generate

src/typescript-scanner.h: \
 node_modules/tree-sitter-typescript/common/scanner.h \
 node_modules/tree-sitter-typescript/LICENSE \
 package.json
	( \
		echo '/*'; \
		echo 'Source:'; \
		$(JQ) -r '.devDependencies["tree-sitter-typescript"]' package.json; \
		echo; \
		cat node_modules/tree-sitter-typescript/LICENSE; \
		echo '*/'; \
		echo; \
		cat $<; \
	) > $@

.PHONY: clean
clean:
	$(RM) -R build target
	$(RM) \
		src/grammar.json \
		src/node-types.json \
		src/parser.c \
		src/tree_sitter/parser.h \
		src/typescript-scanner.h

.PHONY: tests
tests:
	$(TREE_SITTER) test $(TESTFLAGS)

.PHONY: fetch-examples
fetch-examples:
	$(MAKE) -C examples all

.PHONY: parse-examples
parse-examples:
	cat examples/known-failures.txt \
		| sed 's|^|!examples/|' \
		| xargs $(TREE_SITTER) parse -q 'examples/**/*.qml'
