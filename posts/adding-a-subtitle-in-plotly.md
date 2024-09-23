---
title: "Adding a subtitle in plotly"
date: "2024-09-23T08:07:13-0500"
tags: [plotly, python]
summary: ""
---
In plotly, there used to be no way to add a subtitle expliclity. However, now you can add a subtitle as part of the `title` dictionary. For example:
```
python

fig=go.Figure(..., layout=dict(title=dict(text="My cool chart", subtitle=dict(text="It is the best", font=dict(color="gray", size=12)))))
```
