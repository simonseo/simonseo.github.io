#! /bin/zsh

chruby 3.2.0
bundle exec jekyll serve --host localhost --config _config_geoviz.yml --port 4000 --open-url --incremental
