---
title: "Cannot un-fork in github"
date: "2024-09-16T01:12:19-0500"
tags: [github]
summary: ""
---

Although you cannot "un-fork" a GitHub repository, you can do so by cloning what
you've got into a _new_ repository then deleting the original. This way, you've
also removed the fork relationship.

```bash

git clone https://github.com/YOUR_USERNAME/YOUR_FORKED_REPO.git
cd YOUR_FORKED_REPO
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/NEW_REPOSITORY_NAME.git
git push -u origin main
```

Now that the code is safely in the new repository, delete the old one from your
account.
