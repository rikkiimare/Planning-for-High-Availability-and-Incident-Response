# API Service

| ****Category**** | **SLI**                                                                                    | **SLO**                                        |
|------------------|--------------------------------------------------------------------------------------------|------------------------------------------------|
| Availability     | Number of requests that are not errors divided by total number of requests in a 5m period. | 99%                                            |
| Latency          | Server request duration in seconds over 5m period.                                         | 90% of requests below 100ms                    |
|                  | Use rate to take the average, reading should remain under 100ms                            |                                                |
| Error Budget     | Unsuccesful requests to server over 7 days compared to total server                        | Error budget is defined at 20%.                |
|                  | This means that 20% of the requests                                                        | requests over the same period                  |
|                  | can fail and still be within the budget                                                    |                                                |
| Throughput       | Total application server requests per second                                               | 5 RPS indicates the application is functioning |
