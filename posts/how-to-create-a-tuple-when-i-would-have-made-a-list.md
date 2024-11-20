---
title: "How to create a tuple when i would have made a list"
date: "2024-11-20T08:02:16-0600"
tags: [python]
summary: ""
---

When creating tuples of elements you can use the same syntax as lists, only with `()`s instead of `[]`s. e.g. `(1, 2, 3)` instead of `[1, 2, 3]`. `tuple([1, 2, 3])` creates a list, then builds a tuple out of the elements in that list and discards the list, which is a bunch of extra wasteful work. This includes empty tuples `empty_tuple = ()`.

The one confusing caveat to this is tuple comprehension. Whereas for a list you can do `[x * 2 for x in range(5)]` to build the list `[0, 2, 4, 6, 8]`, if you used parenthesis it doesn't make a tuple, but a lazy-evaluated generator, which is typically not want. So that's the case where you would use `tuple(x * 2 for x in range(5))`.

```
>>> [x * 2 for x in range(5)]
[0, 2, 4, 6, 8]
>>> tuple(x * 2 for x in range(5))
(0, 2, 4, 6, 8)
>>> (x * 2 for x in range(5))
<generator object <genexpr> at 0x7fc41fbff9f0>

```
