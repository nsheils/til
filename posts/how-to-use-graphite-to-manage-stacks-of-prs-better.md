---
title: "How to use graphite to manage stacks of PRs better"
date: "2024-11-20T08:06:14-0600"
tags: [git, graphite]
summary: ""
---

[Graphite](https://graphite.dev/) is a tool to help manage stacked PRs. It
promotes the creation of small, review-able PRs. It also promotes a specific
style of git commands which can be useful.

For example, because the focus is on _small_ PRs, the expectation is one branch,
one PR, one commit. That is, instead of a bunch of commits all on one branch
that you are probably going to "squash and merge" anyway, use `gt modify` (same
as `git commit -a --amend --no-edit`) to keep a single commit.

The other pro-tip for using Graphite is to use `gt ss` which is an alias for
`gt submit --stack` to update fully up and down the stack of PRs based on your
most recent commit.
