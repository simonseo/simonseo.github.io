#!/bin/zsh

set -euo pipefail

gem_user_bin="$(ruby -e 'print Gem.user_dir')/bin"
if [[ -x "${gem_user_bin}/bundle" ]]; then
  bundle_cmd="${gem_user_bin}/bundle"
elif command -v bundle >/dev/null 2>&1; then
  bundle_cmd="$(command -v bundle)"
else
  echo "Bundler not found. Install it first with: gem install bundler -v 2.1.4 --user-install" >&2
  exit 1
fi

export BUNDLE_FORCE_RUBY_PLATFORM=true
export BUNDLE_BUILD__NOKOGIRI=--use-system-libraries

if [[ "$#" -eq 0 ]]; then
  set -- serve --host localhost --config _config_github.yml --port 4000 --open-url
fi

exec "${bundle_cmd}" _2.1.4_ exec jekyll "$@"
