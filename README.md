# Swift JSON Benchmarks

Benchmark results for different Swift frameworks which work on JSON (encoding/decoding). For reference there is also a benchmark of .NET Core framework (Newtonsoft.JSON).

## Encoding

Benchmarks of algorithms which transform object to the corresponding JSON string.

### Benchmark #1 - Encoding single object

In this benchmark we are encoding 100 000 times single object.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | Average (sec) | Ranking             |
|---------------|--------------|--------------|--------------|---------------|---------------------|
| HandyJSON     | 6.56         | 6.60         | 6.57         | 6.58          | 6                   |
| Marshall      | 0.97         | 0.96         | 0.96         | 0.96          | 3 :3rd_place_medal: |
| ObjectMapper  | 2.36         | 2.42         | 2.41         | 2.40          | 5                   |
| PMJSON        | 0.58         | 0.59         | 0.57         | 0.58          | 2 :2nd_place_medal: |
| SwiftJson     | 2.08         | 2.13         | 2.12         | 2.11          | 4                   |
| SwiftProtobuf | 0.41         | 0.41         | 0.41         | 0.41          | 1 :1st_place_medal: |
| NetCore       | 0.38         | 0,38         | 0,37         | 0.38          | -                   |


### Benchmark #2 - Encoding list of objects

In this benchmark we are encoding 100 000 times list of 100 objects.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 1007.35      | 970.01       | 974.14       | **983.83**        | 6                   |
| Marshall      | 49.65        | 51.03        | 50.76        | **50.48**         | 2 :2nd_place_medal: |
| ObjectMapper  | 152.63       | 159.42       | 157.67       | **155.62**        | 5                   |
| PMJSON        | 56.88        | 60.02        | 56.20        | **57,70**         | 3 :3rd_place_medal: |
| SwiftJson     | 142.55       | 146.88       | 143.13       | **144.17**        | 4                   |
| SwiftProtobuf | 46.89        | 46.38        | 45.35        | **46.21**         | 1 :1st_place_medal: |
| NetCore       | 20.12        | 20.68        | 20.06        | **20.29**         | -                   |