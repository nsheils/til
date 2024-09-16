# Today I learned

![Build and Deploy](https://img.shields.io/github/actions/workflow/status/nsheils/til/build-and-deploy.yml?logo=githubpages&link=https%3A%2F%2Fgithub.com%2Fnsheils%2Ftil%2Factions%2Fworkflows%2Fbuild-and-deploy.yml)
![License](https://img.shields.io/github/license/nsheils/til)
![Website Up](https://img.shields.io/website?url=https%3A%2F%2Fnsheils.github.io%2Ftil%2F)
![Commit Activity](https://img.shields.io/github/commit-activity/m/nsheils/til?logo=github)

A Hugo-built static site of Today-I-learned (TIL) posts, designed to make it as
easy as possible to publish a new post.

## Scripts

This repo provides two Bash scripts:

- `scripts/til_post.sh` - Create a new TIL post with a pre-populated Markdown
  file and open Vim in insert mode.

- `scripts/til_screenshot.sh` - Capture a screenshot of a selection of the
  screen and save it to the repo's `static/images` directory. The system
  clipboard receives the Markdown to include in the post.

## Publication

[Hugo](https://gohugo.io/) builds the TIL posts into a static HTML site. The
compiled static site is in the `docs/` folder.

The published site has URL: <https://nsheils.github.io/til>

## Hugo theme

The theme for the site is a customized version of
[Etch](https://github.com/LukasJoswiak/etch).

## Repo structure

We've structured the repo to keep the TIL content separate from Hugo—all posts
live in `posts/` while all Hugo-related content is in `/hugosite`.

## Installation

Checkout the repo and create shell aliases for the two helper scripts:

```bash
# ~/.bashrc
source /path/to/repo/install.sh
```

Consider adding this snippet to your Bash start-up script.

We use [Homebrew](https://brew.sh/) to install Hugo and other dependencies.

```sh
brew bundle --file=Brewfile
```

## Usage

Create a new post with:

```sh
til $description
```

For example:

```sh
til that cows cant look up
```

which will create a Markdown file, named by slugifying the description (i.e.
`posts/that-cows-cant-look-up.md`), pre-populated with Hugo front matter:

```markdown
---
title: "TIL that cows can't look-up"
date: "2020-07-24"
tags: []
description: ""
---
```

and open Vim in insert mode with the cursor in the appropriate place.

You then add the TIL content.

To add screenshots, `CTRL+Z` to background Vim and use the screenshot helper:

```sh
til_screenshot $description
```

E.g.

```sh
til_screenshot Alfred preferences UI
```

which will trigger macOS's `screencapture` utility to capture a selection of the
screen. After selection, the resulting PNG image is saved to `static/images/`
using a filename based on a slugified `$description` and the Markdown to include
in the post are added to the system clipboard.

After saving and exiting Vim, the Markdown file and any new images are
automatically committed to the repo and published to GitHub Pages.

## Linting and fixing

Config files exist for:

- [Vale](https://vale.sh/) (`.vale.ini` and `vale/`) - a custom dictionary is
  kept in `vale/styles/Vocab/Local/accept.txt`.
- [MarkdownLint](https://github.com/DavidAnson/markdownlint)
  (`.markdownlint.yml`).
- [Prettier](https://prettier.io/) (`.prettierrc.yaml` and `.prettierignore`).

Use `vale` and `markdownlint` as linters, and `prettier` as a pre-save fixer.

## Acknowledgements

I shamelessly copied this from
[David Winterbottom](https://github.com/codeinthehole/til/). I have made some
modifications to the original codebase to suit my needs.

## Other TIL Collections

- [David Winterbottom](https://til.codeinthehole.com/) --The person I blatantly
  copied in creation of this site.
- [Sam Searles-Bryant](https://samueljsb.co.uk/til/) -[Federico Marani](https://flagzeta.org/til/) -[Josh Branchaud](https://github.com/jbranchaud/til) -[Simon Willison](https://til.simonwillison.net/) -[Jake Worth](https://github.com/jwworth/til) -[Hashrocket](https://til.hashrocket.com/) -[Thoughtbot](https://github.com/thoughtbot/til)

## License

© 2024 Natalie Sheils

This repository use the MIT license. See `LICENSE` for details.
