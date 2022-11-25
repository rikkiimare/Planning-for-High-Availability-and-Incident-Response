# API Service

| Category     | SLI                                                                    | SLO                                       |
|--------------|------------------------------------------------------------------------|-------------------------------------------|
| Availability | sum (rate(apiserver_request_total{job="apiserver",code!~"5.."}[2d])).  |                                           |
|              | / sum (rate(apiserver_request_total{job="apiserver"}[2d]))             | 99%                                       |                       
| Latency      | histogram_quantile(0.90,sum(rate(apiserver_request_duration            |                                           |
|              |  _seconds_bucket{job="apiserver"}[5m])) by (le, verb))                 | 90% of requests below 100ms               |
| Error Budget |  1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver",      | Error budget is defined at 20%.           |
|              |  code="200"}[7d])) by (verb))                                          | This means that 20% of the requests       |
|              |  / sum(increase(apiserver_request_total{job="apiserver"}[7d]))         | can fail and still be within the budget   |
|              |  by (verb)) / (1 - .80))                                               |                                           |
| Throughput   | sum(rate(apiserver_request_total{job="apiserver", code=~"2.."}[5m]))   | 5 RPS indicates the application is        |
|              |                                                                        | functioning                               |
