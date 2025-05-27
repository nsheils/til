---
title: "Pydantic models for datetime can provide details"
date: "2024-10-09T16:42:53-0500"
tags: [python, pydantic]
summary: ""
---

I'm super into pydantic models. They've helped me catch a lot of errors before I
commit code. For datetime objects,
[pydantic can be specific](https://docs.pydantic.dev/2.0/usage/types/datetime/#pydantic-date-types).
The one that is most useful to me is `transaction_datetime_utc: AwareDatetime`
which makes sure that the object has a specified timezone.
