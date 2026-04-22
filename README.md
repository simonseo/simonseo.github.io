---
layout: page
title: "Hitchens"
---

## Simon's blog

This site is a Jekyll blog with posts stored under [`_posts`](/Users/sseo/Documents/simonseo.github.io/_posts).

## Development

### Run locally

```bash
brew install chruby ruby-install
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
ruby-install 3.2.0
chruby 3.2.0
bundle install
./run.sh
```

Alternative commands:

```bash
make test
make build
make serve
```

## License

The code for this theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The font, EB Garamond, is Copyright 2017 The EB Garamond Project Authors and licensed under the [SIL Open Font License Version 1.1](https://github.com/patdryburgh/hitchens/blob/master/assets/fonts/OFL.txt).

Graphics are released to the public domain.
