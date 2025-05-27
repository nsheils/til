# Today I learned

![Website Up](https://img.shields.io/website?url=https%3A%2F%2Fnsheils.github.io%2Ftil%2F)
![Build and Deploy](https://img.shields.io/github/actions/workflow/status/nsheils/til/build-and-deploy.yml?logo=githubpages&link=https%3A%2F%2Fgithub.com%2Fnsheils%2Ftil%2Factions%2Fworkflows%2Fbuild-and-deploy.yml)
![License](https://img.shields.io/github/license/nsheils/til)
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

## Installation

Checkout the repo and create shell aliases for the two helper scripts:

```bash
# ~/.bashrc
source /path/to/repo/install.sh
```

Consider adding this snippet to your Bash start-up script.

Run the following to install all required tools (Hugo, just, markdownlint,
prettier, vale, pre-commit):

```sh
brew bundle --file=Brewfile
./install.sh
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

e.g.

```sh
til_screenshot Alfred preferences UI
```

.

This triggers macOS's `screencapture` utility to capture a selection of the
screen. After selection, the resulting PNG image is saved to `static/images/`
using a filename based on a slugified `$description` and the Markdown to include
in the post are added to the system clipboard.

After saving and exiting Vim, the Markdown file and any new images are
automatically committed to the repo and published to GitHub Pages.

## Common Tasks with just

- **Build the site:**

  ```sh
  just build
  ```

  This will remove the `docs/` directory and rebuild the static site using Hugo.

- **Serve the site locally:**

  ```sh
  just server
  ```

  This will start the Hugo development server.

- **Serve the site on your local network:**

  ```sh
  just network-server
  ```

  This will bind the server to your local IP address so you can view it from
  other devices.

- **Lint your markdown and prose:**

  ```sh
  just lint
  ```

- **Auto-fix markdown and formatting issues:**

  ```sh
  just fix
  ```

## Linting and fixing

Config files exist for:

- [Vale](https://vale.sh/) (`.vale.ini` and `vale/`) - a custom dictionary is
  kept in `vale/styles/Vocab/Local/accept.txt`.
- [MarkdownLint](https://github.com/DavidAnson/markdownlint)
  (`.markdownlint.yml`).
- [Prettier](https://prettier.io/) (`.prettierrc.yaml` and `.prettierignore`).

Use `vale` and `markdownlint` as linters, and `prettier` as a pre-save fixer.

## Publication

[Hugo](https://gohugo.io/) builds the TIL posts into a static HTML site. The
compiled static site is in the `docs/` folder.

The published site has URL: <https://nsheils.github.io/til>

## Repo structure

We've structured the repo to keep the TIL content separate from Hugo—all posts
live in `posts/` while all Hugo-related content is in `/hugosite`.

## Acknowledgements

I shamelessly copied this from
[David Winterbottom](https://github.com/codeinthehole/til/). I have made some
modifications to the original codebase to suit my needs.

### Hugo theme

The theme for the site is a customized version of
[Etch](https://github.com/LukasJoswiak/etch).

## Other TIL Collections

- [David Winterbottom](https://til.codeinthehole.com/) --The person I blatantly
  copied in the creation of this site.
- [Sam Searles-Bryant](https://samueljsb.co.uk/til/)
- [Federico Marani](https://flagzeta.org/til/)
- [Josh Branchaud](https://github.com/jbranchaud/til)
- [Simon Willison](https://til.simonwillison.net/)
- [Jake Worth](https://github.com/jwworth/til)
- [Hashrocket](https://til.hashrocket.com/)
- [Thoughtbot](https://github.com/thoughtbot/til)
