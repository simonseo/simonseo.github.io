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

## Adding a new post

Create a Markdown file inside [`_posts`](/Users/sseo/Documents/simonseo.github.io/_posts) using Jekyll's date-prefix format:

```text
_posts/<section>/<optional-subfolder>/YYYY-MM-DD-slug.md
```

Examples:

- [`_posts/musing/2026-03-04-boulder/2026-03-04-boulder-and-the-stumbling-stone.md`](/Users/sseo/Documents/simonseo.github.io/_posts/musing/2026-03-04-boulder/2026-03-04-boulder-and-the-stumbling-stone.md)
- [`_posts/image synthesis/proj5/2023-04-19-proj5.md`](/Users/sseo/Documents/simonseo.github.io/_posts/image%20synthesis/proj5/2023-04-19-proj5.md)
- [`_posts/geometry based vision/proj2/2023-10-06-proj2.md`](/Users/sseo/Documents/simonseo.github.io/_posts/geometry%20based%20vision/proj2/2023-10-06-proj2.md)

If a post has many images or other assets, put the post in its own folder and store related files next to it.

Example:

```text
_posts/musing/2026-04-22-new-post/
  2026-04-22-new-post.md
  01.png
  02.png
```

In Markdown, reference those assets relative to the post file:

```md
![Scene](01.png)
```

## Sections and URL treatment

Posts are all rendered with the `post` layout, listed on the home page, and included in pagination. The main difference between sections is the URL prefix set in [`config/_config_github.yml`](/Users/sseo/Documents/simonseo.github.io/config/_config_github.yml).

### Folder-based sections

- `_posts/musing` -> `/blog/:title`
- `_posts/image synthesis` -> `/image-synthesis/:title`
- `_posts/geometry based vision` -> `/geometry-based-vision/:title`
- `_posts/physics based vision` -> `/physics-based-vision/:title`
- `_posts/nswi` -> `/nswi/:title`
- `_posts/computational photography` -> `/:title`
- `_posts` root -> `/:title`

`musing`, `image synthesis`, `geometry based vision`, `physics based vision`, and `nswi` have explicit permalink prefixes. `computational photography` currently does not, so it falls back to the global default permalink.

### Front matter categories

The repo currently uses two `categories` values:

- `assignment`
- `opinion`

These categories are metadata only in the current site setup. They appear in the feed, but they do not change layout, styling, pagination, or permalink behavior. The folder a post lives in is what changes the URL structure.

## License

The code for this theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The font, EB Garamond, is Copyright 2017 The EB Garamond Project Authors and licensed under the [SIL Open Font License Version 1.1](https://github.com/patdryburgh/hitchens/blob/master/assets/fonts/OFL.txt).

Graphics are released to the public domain.
