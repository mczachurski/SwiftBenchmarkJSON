# Swift JSON Benchmarks

Benchmark results for different Swift frameworks which work on JSON (encoding/decoding). For reference there is also a benchmark of .NET Core framework (Newtonsoft.JSON), however it's not included in ranks.

All benchmark was performed on my computer:

 - Device: MacBook Pro (13-inch, 2016, Two Thunderbolt 3 ports)
 - Processor: 2 GHz Intel Core i5
 - Memory: 16 GB 1867 MHz LPDDR3
 - Graphics: Intel Iris Graphics 540 1536  MB

Swift version:

```bash
Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)
Target: x86_64-apple-darwin18.5.0
```

Here you can find other benchmark: [https://github.com/bwhiteley/JSONShootout](https://github.com/bwhiteley/JSONShootout)

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

Below there are links to all benchmarked frameworks.

 - [HandyJSON](https://github.com/alibaba/HandyJSON)
 - [Marshall](https://github.com/utahiosmac/Marshal)
 - [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
 - [PMJSON](https://github.com/postmates/PMJSON)
 - [SwiftProtobuf](https://github.com/apple/swift-protobuf.git)
 - Codable - is built in Swift encoding & decoding based on Codable protocol
 - NetCore - is .NET Core implementation of JSON decoding/encoding (Newtonsoft.JSON framework)

## Encoding (serialization)

Benchmarks of algorithms which transform **object(s)** to the corresponding **JSON string**. Object has structure like on following snippet.

```swift
TaskClassDto(
    id: UUID().uuidString,
    createDate: Date(),
    name: "Task 1",
    isFinished: false,
    subtasks: 212,
    weight: 3.14,
    children: ["taska", "taskb", "taskc"],
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. 
        Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus 
        ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae 
        euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. 
        Suspendisse dignissim sapien et consequat lobortis.",
    deadline: Date(),
    tags: ["tag1", "tag2", "tag3", "tag4", "tag5"]
)
```

### Benchmark #1 - Encoding single object

In this benchmark we are encoding 10,000 times single object. 

**Code**

Simple implementation with Swift Codable protocol looks like below.

```swift
let entity = TaskDto(...)

let encoder = JSONEncoder()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
encoder.dateEncodingStrategy = .formatted(formatter)

do {
    for _ in 1...10_000 {
        let jsonData = try encoder.encode(entity)
        _ = String(data: jsonData, encoding: .utf8)
    }
} catch {
    print("Error during serialization object to JSON string: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 3.967        | 3.825        | 3.863        | **3.885**         | 6                   |
| Marshall      | 0.484        | 0.486        | 0.476        | **0.482**         | 3 :3rd_place_medal: |
| ObjectMapper  | 1.162        | 1.138        | 1.048        | **1.116**         | 5                   |
| PMJSON        | 0.472        | 0.469        | 0.459        | **0.467**         | 2 :2nd_place_medal: |
| Codable       | 0.708        | 0.705        | 0.702        | **0.705**         | 4                   |
| SwiftProtobuf | 0.368        | 0.369        | 0.376        | **0.371**         | 1 :1st_place_medal: |
| NetCore       | 0.093        | 0.089        | 0.087        | **0.090**         | -                   |


### Benchmark #2 - Encoding list of objects

In this benchmark we are encoding 10,000 times list of 100 objects. 

**Code**

Implementation with Swift Codable protocol looks like on below snippet.

```swift
let list = getListOfTasks() // Returns array of 100 tasks
let encoder = JSONEncoder()

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
encoder.dateEncodingStrategy = .formatted(formatter)

do {
    for _ in 1...10_000 {
        let jsonData = try encoder.encode(list)
        _ = String(data: jsonData, encoding: .utf8)
    }
} catch {
    print("Error during serialization object to JSON string: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 336.561      | 336.749      | 336.645      | **336.651**       | 6                   |
| Marshall      | 32.776       | 32.136       | 32.346       | **32.419**        | 1 :1st_place_medal: |
| ObjectMapper  | 84.854       | 76.278       | 79.348       | **80.160**        | 5                   |
| PMJSON        | 77.371       | 53.337       | 63.437       | **64.715**        | 4                   |
| Codable       | 51.383       | 49.456       | 50.355       | **50.398**        | 3 :3rd_place_medal: |
| SwiftProtobuf | 36.455       | 36.139       | 36.236       | **36.277**        | 2 :2nd_place_medal: |
| NetCore       | 8.264        | 8.158        | 8.248        | **8.223**         | -                   |

## Decoding (deserialization)

Benchmarks of algorithms which transform JSON to the corresponding object(s). JSON which is parsed looks like on below snippet.

```json
{
    "id": "e24e39c2-7b96-4a16-8cb6-bb96239171e5",
    "createDate": "2009-02-15T00:00:00Z",
    "name": "Task 1",
    "isFinished": false,
    "subtasks": 212,
    "weight": 3.14,
    "children": ["taska", "taskb", "taskc"],
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. 
        Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus 
        ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae 
        euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. 
        Suspendisse dignissim sapien et consequat lobortis.",
    "deadline": "2019-02-15T01:10:00Z",
    "tags": ["tag1", "tag2", "tag3", "tag4", "tag5"]
}
```

### Benchmark #3 - Decoding single object

In this benchmark we are decoding 10,000 times JSON string which represent single object.

**Code**

Simple implementation with Swift Codable protocol.

```swift
let jsonData = getJsonData() // Returns Data object (with single JSON object)
let decoder = JSONDecoder()
let formatter = DateFormatter()

formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
decoder.dateDecodingStrategy = .formatted(formatter)

do {
    for _ in 1...10_000 {
        let entityJsonData = jsonData.data(using: .utf8)!
        _ = try decoder.decode(TaskClassDto.self, from: entityJsonData)
    }
} catch {
    print("Error during deserialization object from JSON string: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 3.787        | 3.392        | 3.472        | **3.550**         | 6                   |
| Marshall      | 1.361        | 1.386        | 1.376        | **1.374**         | 2 :2nd_place_medal: |
| ObjectMapper  | 1.794        | 1.653        | 1.726        | **1.724**         | 3 :3rd_place_medal: |
| PMJSON        | 3.804        | 2.020        | 2.721        | **2.848**         | 5                   |
| Codable       | 1.939        | 1.955        | 1.941        | **1.945**         | 4                   |
| SwiftProtobuf | 0.204        | 0.194        | 0.198        | **0.199**         | 1 :1st_place_medal: |
| NetCore       | 0.188        | 0.179        | 0.182        | **0.183**         | -                   |

### Benchmark #4 - Decoding list of objects

In this benchmark we are decoding 10,000 times JSON string which represent 100 objects.

**Code**

Simple implementation with Swift Codable protocol.

```swift
let listJson = getJsonListData() // Returns Data object (with list of JSON objects)
let decoder = JSONDecoder()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
decoder.dateDecodingStrategy = .formatted(formatter)

do {
    for _ in 1...10_000 {
        let listJsonData = listJson.data(using: .utf8)!
        _ = try decoder.decode([TaskClassDto].self, from: listJsonData)
    }
} catch {
    print("Error during deserialization object from JSON: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 323.744      | 315.371      | 317.336      | **318.817**       | 3 :3rd_place_medal: |
| Marshall      | 128.328      | 117.112      | 119.214      | **121.551**       | 5                   |
| ObjectMapper  | 139.405      | 135.547      | 133.544      | **136.165**       | 2 :2nd_place_medal: |
| PMJSON        | 385.072      | 187.985      | 221.486      | **794,543**       | 4                   |
| Codable       | 170.782      | 171.822      | 171.321      | **171,308**       | 6                   |
| SwiftProtobuf | 14.572       | 14.370       | 14.471       | **14,471**        | 1 :1st_place_medal: |
| NetCore       | 8.368        | 8.283        | 8.189        | **2.367**         | -                   |

## Bonus (Binary SwiftProtobuf)

*SwiftProtobuf* provides additionally binary decoding (instead of JSON string). That kind of encoding/decoding
is very fast. Below there is table with result for each of above test.

| Test                        | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** |
|-----------------------------|--------------|--------------|--------------|-------------------|
| Encoding (single object)    | 0.0459       | 0.0374       | 0.0398       | **0,041**         |
| Encoding (list of objects)  | 3.458        | 3.480        | 3.472        | **3,470**         |
| Dencoding (single object)   | 0.0725       | 0.0615       | 0.0707       | **0,068**         |
| Dencoding (list of objects) | 5.681        | 5.683        | 5.683        | **5,682**         |

It's fastest decoding/encoding. Unfortunately client have to support that kind of data. However, if
your API have to be very fast you should take into account that kind of encoding/decoding.

## Contributing

If you would like to add another framework for comparison, submit a pull request. Add folder with new benchmark implementation (we have separate application for each framework). Add new framework to `build.sh` and `run.sh` scripts.