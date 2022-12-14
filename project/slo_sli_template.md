# API Service

| Category     | SLI                                                                      | SLO                                       |
|--------------|--------------------------------------------------------------------------|-------------------------------------------|
| Availability | Successful server requests for last 2 days                               | 99%                                       | 
| Latency      | Latency of frontend response from server per 5 minutes.                  | 90% of requests below 100ms               |
| Error Budget | Unsuccesful requests to server over 7 days compared to total server      | Error budget is defined at 20%.           |
|              | requests over the same period                                            | This means that 20% of the requests       |
|              |                                                                          | can fail and still be within the budget   |
| Throughput   | Total application server requests per second                             | 5 RPS indicates the application is        |
|              |                                                                          | functioning                               |
