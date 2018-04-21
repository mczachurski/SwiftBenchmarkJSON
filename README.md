# Swift JSON Benchmarks

Benchmark results for different Swift frameworks which work on JSON (encoding/decoding). For reference there is also a benchmark of .NET Core framework (Newtonsoft.JSON).

All benchmark was performed on my computer:

 - Device: MacBook Pro (13-inch, 2016, Two Thunderbolt 3 ports)
 - Processor: 2 GHz Intel Core i5
 - Memory: 16 GB 1867 MHz LPDDR3
 - Graphics: Intel Iris Graphics 540 1536  MB

Other benchmark:
https://github.com/bwhiteley/JSONShootout

## Build & Run benchmarks

**Prerequisites**

Before you start to run benchmarks on your device you have to install:

 - [Swift](https://swift.org/getting-started/#installing-swift)
 - [.NET Core](https://www.microsoft.com/net/learn/get-started/macos)

 When you want to change Swift Protobuf model you need to have additional applications:

 - [Google Protobuf compiler](https://github.com/google/protobuf)
 - [Swift Protobuf code generator](https://github.com/apple/swift-protobuf/)

**Build & Run**

To build and run you have to execute following commands:

```bash
$ git clone https://github.com/mczachurski/SwiftBenchmarkJSON.git
$ cd SwiftBenchmarkJSON
$ ./build.sh
$ ./run.sh
```

## List of frameworks

Below there are links to all frameworks.

 - [HandyJSON](https://github.com/alibaba/HandyJSON)
 - [Marshall](https://github.com/utahiosmac/Marshal)
 - [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
 - [PMJSON](https://github.com/postmates/PMJSON)
 - [SwiftProtobuf](https://github.com/apple/swift-protobuf.git)

## Encoding

Benchmarks of algorithms which transform object to the corresponding JSON string.

### Benchmark #1 - Encoding single object

In this benchmark we are encoding 100 000 times single object.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 6.56         | 6.60         | 6.57         | **6.58**          | 6                   |
| Marshall      | 0.97         | 0.96         | 0.96         | **0.96**          | 3 :3rd_place_medal: |
| ObjectMapper  | 2.36         | 2.42         | 2.41         | **2.40**          | 5                   |
| PMJSON        | 0.58         | 0.59         | 0.57         | **0.58**          | 2 :2nd_place_medal: |
| SwiftJson     | 2.08         | 2.13         | 2.12         | **2.11**          | 4                   |
| CodableJson   | 0.41         | 0.41         | 0.41         | **0.41**          | 1 :1st_place_medal: |
| NetCore       | 0.38         | 0,38         | 0,37         | **0.38**          | -                   |


### Benchmark #2 - Encoding list of objects

In this benchmark we are encoding 100 000 times list of 100 objects.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 1007.35      | 970.01       | 974.14       | **983.83**        | 6                   |
| Marshall      | 49.65        | 51.03        | 50.76        | **50.48**         | 2 :2nd_place_medal: |
| ObjectMapper  | 152.63       | 159.42       | 157.67       | **155.62**        | 5                   |
| PMJSON        | 56.88        | 60.02        | 56.20        | **57,70**         | 3 :3rd_place_medal: |
| CodableJson   | 142.55       | 146.88       | 143.13       | **144.17**        | 4                   |
| SwiftProtobuf | 46.89        | 46.38        | 45.35        | **46.21**         | 1 :1st_place_medal: |
| NetCore       | 20.12        | 20.68        | 20.06        | **20.29**         | -                   |

### Benchmar #3 - Decoding single object

In this benchmark we are decoding 100 000 times JSON file which represent single object.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 2.87         | 2.93         | 3.24         | **3.01**          | 4                   |
| Marshall      | 0.73         | 0.78         | 0.75         | **0.75**          | 2 :2nd_place_medal: |
| ObjectMapper  | 2.15         | 2.16         | 2.23         | **2.18**          | 3 :3rd_place_medal: |
| PMJSON        | 11.09        | 11.14        | 11.65        | **11.30**         | 6                   |
| CodableJson   | 8.19         | 8.13         | 8.58         | **8.30**          | 5                   |
| SwiftProtobuf | 0.48         | 0.50         | 0.47         | **0.48**          | 1 :1st_place_medal: |
| NetCore       | 0.42         | 0.46         | 0.45         | **0.44**          | -                   |

### Benchmark #4 - Decoding list of objects

In this benchmark we are decoding 100 000 times JSON file which represent 100 objects.

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 18.86        | 19.04        | 19.80        | **19.23**         | 1 :1st_place_medal: |
| Marshall      | 52.29        | 53.82        | 52.85        | **52.99**         | 3 :3rd_place_medal: |
| ObjectMapper  | 146.87       | 144.20       | 149.96       | **147.01**        | 4                   |
| PMJSON        | 1089.41      | 1072.79      | 1145.52      | **1102.57**       | 6                   |
| CodableJson   | 760.58       | 775.58       | 770.42       | **68.86**         | 5                   |
| SwiftProtobuf | 23.92        | 25.88        | 23.80        | **24.53**         | 2 :2nd_place_medal: |
| NetCore       | 30.14        | 33.40        | 31.06        | **31.53**         | -                   |