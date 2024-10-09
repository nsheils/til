---
title: "Pydantic models for datetime can be really detailed"
date: "2024-10-09T16:42:53-0500"
tags: [python, pydantic]
summary: ""
---

I'm very into pydantic models. They've helped me catch so many errors before my code is pushed. For datetime objects, [pydantic can be very specific](https://docs.pydantic.dev/2.0/usage/types/datetime/#pydantic-date-types). The one that is most useful to me is `transaction_datetime_utc: AwareDatetime` which makes sure a timezone is specified. 
