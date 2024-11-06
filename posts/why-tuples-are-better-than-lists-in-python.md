---
title: "Why tuples are better than lists in python"
date: "2024-11-06T07:58:10-0600"
tags: [python]
summary: ""
---

Use immutable objects (tuples, collections) in place of mutable ones (lists) in
Python. They provide better logic (since they won't change on you in the rest of
the code) and are _way_ speedier.

Python lists are basically an arraylist with each node referencing the actual
object instead of encapsulating it. So iteration on the object requires a bunch
more jumping around in memory.

Check out the following toy example:

```bash
$ python -m timeit "x=(1,2,3,4)+(5,6,7,8)"
50000000 loops, best of 5: 6.44 nsec per loop

$ python -m timeit "x=[1,2,3,4]+[5,6,7,8]"
5000000 loops, best of 5: 80.3 nsec per loop
```
