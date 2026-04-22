.PHONY: setup clean test build serve
SHELL:=/bin/bash
CONFIG ?= config/_config_github.yml
BUNDLE := $(shell if [ -x "$$(ruby -e 'print Gem.user_dir')/bin/bundle" ]; then printf "%s" "$$(ruby -e 'print Gem.user_dir')/bin/bundle"; elif command -v bundle >/dev/null 2>&1; then command -v bundle; fi)
JEKYLL := BUNDLE_FORCE_RUBY_PLATFORM=true BUNDLE_BUILD__NOKOGIRI=--use-system-libraries $(BUNDLE) _2.1.4_ exec jekyll

# Assumes `gem install bundler`
setup:
	$(JEKYLL) -v
	$(BUNDLE) _2.1.4_ install

update:
	$(BUNDLE) _2.1.4_ update

clean:
	$(JEKYLL) clean

test:
	$(JEKYLL) doctor --config $(CONFIG)

build:
	$(JEKYLL) build --config $(CONFIG) --future --trace

serve:
	$(JEKYLL) serve --host localhost --config $(CONFIG) --port 4000 --open-url --incremental
	
