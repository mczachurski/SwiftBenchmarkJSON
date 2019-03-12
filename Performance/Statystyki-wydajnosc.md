# Health (benchmark 001)

## MacBook Pro 13

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/health
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/health
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    56.41ms   16.57ms   1.11s    97.56%
    Req/Sec    89.82     12.27   121.00     87.22%
  214499 requests in 10.00m, 65.05MB read
Requests/sec:    357.43
Transfer/sec:    111.00KB
```

**ASP.NET Core**

```bSH
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/health
```

```
Running 10m test @ https://taskercore.azurewebsites.net/health
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    69.47ms   19.92ms 890.17ms   89.43%
    Req/Sec    72.97     16.80   111.00     64.37%
  173950 requests in 10.00m, 55.75MB read
Requests/sec:    289.89
Transfer/sec:     95.13KB
```

## Ubuntu on Azure

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/health
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/health
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    29.32ms    7.02ms 307.62ms   91.57%
    Req/Sec   171.82     26.71   222.00     81.21%
  411057 requests in 10.00m, 124.66MB read
Requests/sec:    685.01
Transfer/sec:    212.73KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/health
```

```
Running 10m test @ https://taskercore.azurewebsites.net/health
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    45.53ms   20.87ms   1.08s    85.01%
    Req/Sec   112.04     26.90   210.00     66.89%
  267674 requests in 10.00m, 85.79MB read
Requests/sec:    446.06
Transfer/sec:    146.38KB
```

## Chart

![benchmark-001](benchmark-001.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #1"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "214499",
			"ASP.NET Core": "173950"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "411057",
			"ASP.NET Core": "267674"
		}
	]
}
```

# List - Swift with Perfect CRUD (benchmark 002)

## MacBook Pro 

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjM3MjUyNDUuNzAzMjYsIm5hbWUiOiJtYXJ0aW4uZG9lQGVtYWlsLmNvbSIsImlzcyI6InRhc2tlci1zZXJ2ZXItaXNzdWVyIiwiaWF0IjoxNTIzNjg5MjQ1LjcwMzI2LCJ1aWQiOiIxMEM0MjkyOS0zRjdFLTQ2QjYtODE2RS01NTQwOERBOUY0OTAiLCJyb2xlcyI6W119.dF-g61nLBvpeM3WUlczhTCskVMrYnifE3__IfVmrA10"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.28s   114.55ms   2.00s    73.25%
    Req/Sec     4.81      3.21    20.00     59.63%
  9368 requests in 10.00m, 100.78MB read
  Socket errors: connect 0, read 0, write 0, timeout 21
Requests/sec:     15.61
Transfer/sec:    171.98KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   208.81ms  117.32ms   1.25s    84.94%
    Req/Sec    26.55     12.43    79.00     58.23%
  60193 requests in 10.00m, 695.40MB read
Requests/sec:    100.30
Transfer/sec:      1.16MB
```

## Ubuntu (Azure)

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJEMTE4NkI0NS04OTVDLTQ5QjAtQkFGOS1DQzMxRUUzM0E5RkMiLCJpYXQiOjE1MjM2OTM0MDcuMjYxNjgsInJvbGVzIjpbXSwibmFtZSI6Im1hcnRpbi5kb2VAZW1haWwuY29tIiwiaXNzIjoidGFza2VyLXNlcnZlci1pc3N1ZXIiLCJleHAiOjE1MjM3Mjk0MDcuMjYxNjl9.Em_hlFmpna4XWUnIG5WObyI3phzoGOyIIQmlIeuKbE4"
```


```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.34s   101.03ms   1.99s    77.65%
    Req/Sec     6.29      4.33    20.00     79.62%
  8951 requests in 10.00m, 96.30MB read
  Socket errors: connect 0, read 0, write 0, timeout 15
Requests/sec:     14.92
Transfer/sec:    164.34KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   193.72ms   51.93ms   1.01s    86.83%
    Req/Sec    26.39     10.45    90.00     63.50%
  62260 requests in 10.00m, 719.11MB read
Requests/sec:    103.75
Transfer/sec:      1.20MB
```

### Chart

![benchamrk-002](benchmark-002.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #2"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "9368",
			"ASP.NET Core": "60193"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "8951",
			"ASP.NET Core": "62260"
		}
	]
}
```

# List - Swift without SQLite (benchmark 003)

## MacBook Pro 

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjM3MjUyNDUuNzAzMjYsIm5hbWUiOiJtYXJ0aW4uZG9lQGVtYWlsLmNvbSIsImlzcyI6InRhc2tlci1zZXJ2ZXItaXNzdWVyIiwiaWF0IjoxNTIzNjg5MjQ1LjcwMzI2LCJ1aWQiOiIxMEM0MjkyOS0zRjdFLTQ2QjYtODE2RS01NTQwOERBOUY0OTAiLCJyb2xlcyI6W119.dF-g61nLBvpeM3WUlczhTCskVMrYnifE3__IfVmrA10"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   215.63ms  185.10ms   1.94s    66.70%
    Req/Sec    11.66      5.20    40.00     64.87%
  19549 requests in 10.88m, 215.82MB read
  Socket errors: connect 0, read 6, write 0, timeout 1
Requests/sec:     29.96
Transfer/sec:    338.66KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   208.81ms  117.32ms   1.25s    84.94%
    Req/Sec    26.55     12.43    79.00     58.23%
  60193 requests in 10.00m, 695.40MB read
Requests/sec:    100.30
Transfer/sec:      1.16MB
```

## Ubuntu (Azure)

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJEMTE4NkI0NS04OTVDLTQ5QjAtQkFGOS1DQzMxRUUzM0E5RkMiLCJpYXQiOjE1MjM2OTM0MDcuMjYxNjgsInJvbGVzIjpbXSwibmFtZSI6Im1hcnRpbi5kb2VAZW1haWwuY29tIiwiaXNzIjoidGFza2VyLXNlcnZlci1pc3N1ZXIiLCJleHAiOjE1MjM3Mjk0MDcuMjYxNjl9.Em_hlFmpna4XWUnIG5WObyI3phzoGOyIIQmlIeuKbE4"
```


```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   469.01ms   53.63ms   1.19s    88.66%
    Req/Sec    11.52      4.85    30.00     65.58%
  25586 requests in 10.00m, 282.46MB read
Requests/sec:     42.64
Transfer/sec:    482.00KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   193.72ms   51.93ms   1.01s    86.83%
    Req/Sec    26.39     10.45    90.00     63.50%
  62260 requests in 10.00m, 719.11MB read
Requests/sec:    103.75
Transfer/sec:      1.20MB
```

### Chart

![benchmark-003](benchmark-003.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #3"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "19549",
			"ASP.NET Core": "60193"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "25586",
			"ASP.NET Core": "62260"
		}
	]
}
```

# List - Swift without Services/Repositories with encoding fixes (benchmark 004)

## MacBook Pro 

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjM3MjUyNDUuNzAzMjYsIm5hbWUiOiJtYXJ0aW4uZG9lQGVtYWlsLmNvbSIsImlzcyI6InRhc2tlci1zZXJ2ZXItaXNzdWVyIiwiaWF0IjoxNTIzNjg5MjQ1LjcwMzI2LCJ1aWQiOiIxMEM0MjkyOS0zRjdFLTQ2QjYtODE2RS01NTQwOERBOUY0OTAiLCJyb2xlcyI6W119.dF-g61nLBvpeM3WUlczhTCskVMrYnifE3__IfVmrA10"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   398.24ms   51.55ms   1.46s    85.83%
    Req/Sec    13.35      7.28    40.00     80.32%
  30124 requests in 10.00m, 332.56MB read
Requests/sec:     50.20
Transfer/sec:    567.48KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   208.81ms  117.32ms   1.25s    84.94%
    Req/Sec    26.55     12.43    79.00     58.23%
  60193 requests in 10.00m, 695.40MB read
Requests/sec:    100.30
Transfer/sec:      1.16MB
```

## Ubuntu (Azure)

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJEMTE4NkI0NS04OTVDLTQ5QjAtQkFGOS1DQzMxRUUzM0E5RkMiLCJpYXQiOjE1MjM2OTM0MDcuMjYxNjgsInJvbGVzIjpbXSwibmFtZSI6Im1hcnRpbi5kb2VAZW1haWwuY29tIiwiaXNzIjoidGFza2VyLXNlcnZlci1pc3N1ZXIiLCJleHAiOjE1MjM3Mjk0MDcuMjYxNjl9.Em_hlFmpna4XWUnIG5WObyI3phzoGOyIIQmlIeuKbE4"
```


```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   400.59ms   52.31ms   1.35s    89.30%
    Req/Sec    13.05      5.26    30.00     65.64%
  29969 requests in 10.00m, 330.85MB read
Requests/sec:     49.94
Transfer/sec:    564.56KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   193.72ms   51.93ms   1.01s    86.83%
    Req/Sec    26.39     10.45    90.00     63.50%
  62260 requests in 10.00m, 719.11MB read
Requests/sec:    103.75
Transfer/sec:      1.20MB
```

### Chart

![benchmark-004](benchmark-004.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #4"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "30124",
			"ASP.NET Core": "60193"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "29969",
			"ASP.NET Core": "62260"
		}
	]
}
```

# List - Swift only route with main.swift (benchmark 005)

## MacBook Pro 

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjM3MjUyNDUuNzAzMjYsIm5hbWUiOiJtYXJ0aW4uZG9lQGVtYWlsLmNvbSIsImlzcyI6InRhc2tlci1zZXJ2ZXItaXNzdWVyIiwiaWF0IjoxNTIzNjg5MjQ1LjcwMzI2LCJ1aWQiOiIxMEM0MjkyOS0zRjdFLTQ2QjYtODE2RS01NTQwOERBOUY0OTAiLCJyb2xlcyI6W119.dF-g61nLBvpeM3WUlczhTCskVMrYnifE3__IfVmrA10"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   385.52ms   74.88ms   1.50s    88.31%
    Req/Sec    13.57      6.94    49.00     84.76%
  31155 requests in 10.00m, 342.98MB read
Requests/sec:     51.92
Transfer/sec:    585.26KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   208.81ms  117.32ms   1.25s    84.94%
    Req/Sec    26.55     12.43    79.00     58.23%
  60193 requests in 10.00m, 695.40MB read
Requests/sec:    100.30
Transfer/sec:      1.16MB
```

## Ubuntu (Azure)

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJEMTE4NkI0NS04OTVDLTQ5QjAtQkFGOS1DQzMxRUUzM0E5RkMiLCJpYXQiOjE1MjM2OTM0MDcuMjYxNjgsInJvbGVzIjpbXSwibmFtZSI6Im1hcnRpbi5kb2VAZW1haWwuY29tIiwiaXNzIjoidGFza2VyLXNlcnZlci1pc3N1ZXIiLCJleHAiOjE1MjM3Mjk0MDcuMjYxNjl9.Em_hlFmpna4XWUnIG5WObyI3phzoGOyIIQmlIeuKbE4"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   376.99ms   47.72ms   1.11s    89.53%
    Req/Sec    14.03      6.15    40.00     89.11%
  31840 requests in 10.00m, 350.52MB read
Requests/sec:     53.06
Transfer/sec:    598.12KB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   193.72ms   51.93ms   1.01s    86.83%
    Req/Sec    26.39     10.45    90.00     63.50%
  62260 requests in 10.00m, 719.11MB read
Requests/sec:    103.75
Transfer/sec:      1.20MB
```

### Chart

![benchmark-005](benchmark-005.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #5"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "31155",
			"ASP.NET Core": "60193"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "31840",
			"ASP.NET Core": "62260"
		}
	]
}
```

# List - Faster server (S3 Standard 4Core)

## MacBook Pro 

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjM3MjUyNDUuNzAzMjYsIm5hbWUiOiJtYXJ0aW4uZG9lQGVtYWlsLmNvbSIsImlzcyI6InRhc2tlci1zZXJ2ZXItaXNzdWVyIiwiaWF0IjoxNTIzNjg5MjQ1LjcwMzI2LCJ1aWQiOiIxMEM0MjkyOS0zRjdFLTQ2QjYtODE2RS01NTQwOERBOUY0OTAiLCJyb2xlcyI6W119.dF-g61nLBvpeM3WUlczhTCskVMrYnifE3__IfVmrA10"
```

```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    89.52ms   19.93ms   1.36s    90.02%
    Req/Sec    56.11     10.27   101.00     73.67%
  134385 requests in 10.00m, 1.44GB read
  Non-2xx or 3xx responses: 2
Requests/sec:    223.95
Transfer/sec:      2.47MB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    65.34ms   17.29ms   1.36s    95.44%
    Req/Sec    77.25     12.92   101.00     78.85%
  184693 requests in 10.00m, 2.08GB read
  Non-2xx or 3xx responses: 2
Requests/sec:    307.77
Transfer/sec:      3.56MB
```

## Ubuntu (Azure)

**Swift**

```bash
wrk -d 10m -t 4 -c 20 https://taskerswift.azurewebsites.net/tasks -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJEMTE4NkI0NS04OTVDLTQ5QjAtQkFGOS1DQzMxRUUzM0E5RkMiLCJpYXQiOjE1MjM2OTM0MDcuMjYxNjgsInJvbGVzIjpbXSwibmFtZSI6Im1hcnRpbi5kb2VAZW1haWwuY29tIiwiaXNzIjoidGFza2VyLXNlcnZlci1pc3N1ZXIiLCJleHAiOjE1MjM3Mjk0MDcuMjYxNjl9.Em_hlFmpna4XWUnIG5WObyI3phzoGOyIIQmlIeuKbE4"
```


```
Running 10m test @ https://taskerswift.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    88.01ms   20.68ms 900.83ms   83.36%
    Req/Sec    55.87     10.90   131.00     72.91%
  134024 requests in 10.00m, 1.44GB read
  Socket errors: connect 0, read 0, write 0, timeout 11
  Non-2xx or 3xx responses: 11
Requests/sec:    223.34
Transfer/sec:      2.46MB
```

**ASP.NET Core**

```bash
wrk -d 10m -t 4 -c 20 https://taskercore.azurewebsites.net/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJiMmM4YmUwNi03ZjRhLTQxOTctYjk1Ny1lODgyYTkwMjc2YWIiLCJuYW1lIjoibWFydGluLmRvZUBlbWFpbC5jb20iLCJpc3MiOiJodHRwOi8vdGFza2VyLyIsImlhdCI6IjE1MjM2ODc1NjAiLCJleHAiOiIxNTIzNjg4NzYwIiwiYXVkIjoiaHR0cDovL3Rhc2tlci8ifQ.snA5bi1V9A9VWe5SXLZCSC1vTA3RLG8_MMP42I5A73M"
```

```
Running 10m test @ https://taskercore.azurewebsites.net/tasks
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    48.06ms   21.06ms   1.04s    90.92%
    Req/Sec   105.66     19.89   171.00     72.99%
  252634 requests in 10.00m, 2.85GB read
  Non-2xx or 3xx responses: 7
Requests/sec:    421.02
Transfer/sec:      4.86MB
```

### Chart

![benchmark-006](benchmark-006.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"theme": "dark",
	"categoryAxis": {},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "Swift",
			"type": "column",
			"valueField": "Swift"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "ASP.NET Core",
			"type": "column",
			"valueField": "ASP.NET Core"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"minimum": 0,
			"title": "Requests (10 minutes)"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": true,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Benchmark #6"
		}
	],
	"dataProvider": [
		{
			"category": "MacBook Pro",
			"Swift": "134385",
			"ASP.NET Core": "184693"
		},
		{
			"category": "Ubuntu (Azure)",
			"Swift": "134024",
			"ASP.NET Core": "252634"
		}
	]
}
```

# Swift performance (JSON encoding)

## Endpoint 1 (Static JSON)

```
Running 10m test @ https://taskerperf.azurewebsites.net/endp1
  4 threads and 20 connections
Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    33.99ms   12.59ms 826.84ms   82.98%
    Req/Sec   149.09     31.07   240.00     72.59%
  356555 requests in 10.00m, 4.00GB read
Requests/sec:    594.18
Transfer/sec:      6.83MB
```

## Endpoint 2 (Swift JSONEncoder)

```
Running 10m test @ https://taskerperf.azurewebsites.net/endp3
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   535.71ms   81.57ms   1.29s    87.41%
    Req/Sec    10.88      5.65    40.00     56.66%
  22397 requests in 10.00m, 244.24MB read
Requests/sec:     37.32
Transfer/sec:    416.80KB
```

## Endpoint 3 (Swift JSONEncoder - static list)

```
Running 10m test @ https://taskerperf.azurewebsites.net/endp3
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   512.36ms   71.76ms   1.38s    85.94%
    Req/Sec    10.87      5.22    40.00     64.91%
  23418 requests in 10.00m, 255.45MB read
Requests/sec:     39.02
Transfer/sec:    435.89KB
```

## Endpoint 4 (Perfect JsonEncodedString)

```
Running 10m test @ https://taskerperf.azurewebsites.net/endp4
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.11s   104.49ms   1.98s    74.96%
    Req/Sec     6.09      4.17    20.00     94.34%
  10770 requests in 10.00m, 147.35MB read
  Socket errors: connect 0, read 0, write 0, timeout 3
Requests/sec:     17.95
Transfer/sec:    251.44KB
```

## Endpoint 5 (Perfect JsonEncodedString - static list)

```
Running 10m test @ https://taskerperf.azurewebsites.net/endp5
  4 threads and 20 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.03s   100.46ms   1.93s    74.96%
    Req/Sec     6.55      4.10    20.00     82.45%
  11620 requests in 10.00m, 158.98MB read
Requests/sec:     19.37
Transfer/sec:    271.31KB
```

## Chart

![benchmark-007](benchmark-007.png)

```json
{
	"type": "serial",
	"categoryField": "category",
	"startDuration": 1,
	"theme": "dark",
	"categoryAxis": {
		"gridPosition": "start"
	},
	"trendLines": [],
	"graphs": [
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-1",
			"title": "graph 1",
			"type": "column",
			"valueField": "column-1"
		},
		{
			"balloonText": "[[title]] of [[category]]:[[value]]",
			"fillAlphas": 1,
			"id": "AmGraph-2",
			"title": "graph 2",
			"type": "column",
			"valueField": "column-2"
		}
	],
	"guides": [],
	"valueAxes": [
		{
			"id": "ValueAxis-1",
			"stackType": "regular",
			"title": "Axis title"
		}
	],
	"allLabels": [],
	"balloon": {},
	"legend": {
		"enabled": false,
		"useGraphSettings": true
	},
	"titles": [
		{
			"id": "Title-1",
			"size": 15,
			"text": "Performance"
		}
	],
	"dataProvider": [
		{
			"category": "Static JSON",
			"column-1": "356555"
		},
		{
			"category": "JSONEncoder",
			"column-1": "22397"
		},
		{
			"category": "JSONEncoder - static list",
			"column-1": "23418"
		},
		{
			"category": "JsonEncodedString",
			"column-1": "10770"
		},
		{
			"category": "JsonEncodedString - static list",
			"column-1": "11620"
		}
	]
}
```