---
layout: page
title: "Hitchens"
---

## Theme
An inarguably well-designed [Jekyll](http://jekyllrb.com) theme by [Pat Dryburgh](https://patdryburgh.com).


### Development

#### MacOS
```
brew install chruby ruby-install
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc     
ruby-install 3.2.0
chruby 3.2.0
bundle install
bundle exec jekyll serve --config _config.yml
bundle exec jekyll serve --config _config_github.yml
bundle exec jekyll build --config _config.yml
bundle exec jekyll build --config _config_github.yml
```



To set up your environment to develop this theme, run `bundle install`.

The theme is setup just like a normal Jekyll site. To test the theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using the theme. Add pages, documents, data, etc. like normal to test the theme's contents. As you make modifications to the theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

### License

The code for this theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The font, EB Garamond, is Copyright 2017 The EB Garamond Project Authors and licensed under the [SIL Open Font License Version 1.1](https://github.com/patdryburgh/hitchens/blob/master/assets/fonts/OFL.txt).

Graphics are released to the public domain.
