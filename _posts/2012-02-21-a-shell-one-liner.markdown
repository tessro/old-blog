---
layout: post
title: "A shell one-liner"
date: 2012-02-21 15:38
comments: true
categories: 
---

```bash
git log --grep <query> | sed -n '/^commit/p' | cut -d\  -f 2 | xargs git show
```

Show all changesets matching *query*. Useful for reviewing a series of related
changes over time. (Assuming consistent commit message habits.)

Don't fear the shell.
