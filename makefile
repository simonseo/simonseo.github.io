jekyll=bundle exec jekyll
.PHONY: setup clean test build serve
SHELL:=/bin/bash

# Assumes `gem install bundler`
setup:
	bundle install

update:
	bundle update

clean:
	$(jekyll) clean

test:
	$(jekyll) doctor

build:
	$(jekyll) build --config $(CONFIG) --future --trace

serve:
	$(jekyll) serve --host localhost --config $(CONFIG) --port 4000 --open-url --incremental
	