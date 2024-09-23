---
title: "To create stacked and grouped bar charts"
date: "2024-09-23T08:15:20-0500"
tags: [plotly, python]
summary: ""
---

I needed to create bar charts that were stacked (duh, this is the best kind) but
I also wanted them grouped. This proved more difficult than I first expected.
Example code as follows:

```python

import pandas as pd
import plotly.graph_objects as go

# Sample data
data = {
    "period": ["2024-01-01", "2024-01-01", "2024-01-01", "2024-01-01",
               "2024-02-01", "2024-02-01", "2024-02-01", "2024-02-01"],
    "user_group": ["new", "new", "super-user", "super-user",
                   "new", "new", "super-user", "super-user"],
    "type": ["really new", "kind of new", "employee", "experienced",
             "really new", "kind of new", "employee", "experienced"],
    "count": [100, 40, 50, 70, 90, 30, 70, 120]
}

df = pd.DataFrame(data)

# Create the figure with layout
fig = go.Figure(
    layout=go.Layout(
        barmode="relative",  # Bars stacked within user groups
        xaxis=dict(type="category", title="Date"),
        yaxis=dict(title="Count", range=[0, 200]),
        yaxis2=go.layout.YAxis(visible=False, matches="y", overlaying="y", anchor="x"),  # Invisible secondary y-axis
        legend=dict(x=1.1, y=1, orientation="v")  # Legend placed to the right
    )
)

bar_width = 0.3

# Define y-axis and offset for each user group
y_axis_dict = {
    "new": {"yaxis": 'y1', "offset": 0},
    "super-user": {"yaxis": 'y2', "offset": -bar_width}
}

# Add bars for each user group and type
for user_group in df['user_group'].unique():
    group_data = df[df['user_group'] == user_group]

    for type_value in group_data['type'].unique():
        type_data = group_data[group_data['type'] == type_value]

        fig.add_bar(
            x=type_data['period'],
            y=type_data['count'],
            yaxis=y_axis_dict[user_group]["yaxis"],
            offset=y_axis_dict[user_group]["offset"],
            offsetgroup=user_group,
            width=bar_width,
            name=str(type_value),
            legendgroup=user_group,
            legendgrouptitle_text=user_group
        )

# Display the figure
fig.show()

```
