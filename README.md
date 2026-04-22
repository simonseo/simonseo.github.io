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

## Front matter reference

Use this as the default template:

```yaml
---
title: "My Post Title"
layout: post
author: "Simon Seo"
categories: opinion
date: 2026-04-22
toc: true
style: musing
mathjax: false
---
```

### Supported fields used by this repo

- `title`
  - String.
  - If non-empty, it is shown as the page title and in the home page list.
  - If set to `""`, the list view falls back to an excerpt instead of a title.
- `layout`
  - Use `post` for blog posts.
- `author`
  - Free text shown at the bottom of the post.
- `categories`
  - Usually `assignment` or `opinion`.
  - Informational only in the current setup.
- `date`
  - Publication date shown on the page and used for sorting.
  - The filename should still start with a date even if this field differs.
- `toc`
  - Boolean.
  - `true` shows the generated table of contents.
  - `false` suppresses it.
- `style`
  - Optional CSS class added to the `<article>` element.
  - Used for post-specific styling from [`_sass/_post-specific.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_post-specific.scss).
- `mathjax`
  - Boolean.
  - `true` loads MathJax for LaTeX rendering.
- `permalink`
  - Optional manual override for the generated URL.
  - Use only when you need a custom path that differs from the folder defaults.

### Values already used in `style`

Current post-specific style names include:

- `image-synthesis-proj5`
- `image-synthesis-project`
- `pinhole-cameras`
- `geoviz-proj1`
- `hdr-imaging`
- `musing-ai-agents`
- `musing`

## Adding styling

There are two levels of styling in this repo.

### Site-wide styling

Edit [`assets/css/main.scss`](/Users/sseo/Documents/simonseo.github.io/assets/css/main.scss) and the partials in [`_sass`](/Users/sseo/Documents/simonseo.github.io/_sass), such as:

- [`_sass/_base.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_base.scss)
- [`_sass/_article.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_article.scss)
- [`_sass/_post-list.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_post-list.scss)
- [`_sass/_toc.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_toc.scss)

Use this for shared typography, layout, post body rules, and components.

### Post-specific styling

1. Add a `style` value in the post front matter.
2. Define a matching class in [`_sass/_post-specific.scss`](/Users/sseo/Documents/simonseo.github.io/_sass/_post-specific.scss).

Example:

```yaml
---
title: "Example"
layout: post
author: "Simon Seo"
categories: assignment
date: 2026-04-22
style: example-post
---
```

```scss
.example-post {
  img {
    margin: 0 auto;
  }

  .post-content {
    max-width: fit-content;
  }
}
```

Because [`_layouts/post.html`](/Users/sseo/Documents/simonseo.github.io/_layouts/post.html) renders:

```html
<article class="post h-entry {% if page.style %}{{ page.style }} {% endif %}">
```

the `style` value becomes a class on the article element for that post only.

## Notes

- The home page lists all posts regardless of folder.
- The site paginates posts 8 per page.
- `make build` runs Jekyll with `--future`, so future-dated posts are included in local builds.
- If you change config in [`config/_config_github.yml`](/Users/sseo/Documents/simonseo.github.io/config/_config_github.yml), restart the dev server.

## License

The code for this theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The font, EB Garamond, is Copyright 2017 The EB Garamond Project Authors and licensed under the [SIL Open Font License Version 1.1](https://github.com/patdryburgh/hitchens/blob/master/assets/fonts/OFL.txt).

Graphics are released to the public domain.
