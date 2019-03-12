# Swift JSON Benchmarks

Benchmark results for different Swift frameworks which work on JSON (encoding/decoding). For reference there is also a benchmark of .NET Core framework (Newtonsoft.JSON), however it's not included in ranks.

All benchmark was performed on my computer:

 - Device: MacBook Pro (13-inch, 2016, Two Thunderbolt 3 ports)
 - Processor: 2 GHz Intel Core i5
 - Memory: 16 GB 1867 MHz LPDDR3
 - Graphics: Intel Iris Graphics 540 1536  MB

Swift version:

```bash
Apple Swift version 4.1 (swiftlang-902.0.48 clang-902.0.37.1)
Target: x86_64-apple-darwin17.5.0
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

Benchmarks of algorithms which transform object(s) to the corresponding JSON string. Object has structure like on following snipper.

```swift
class TaskDto {
    public var id: String?
    public var createDate: Date?
    public var name: String
    public var isFinished: Bool
    public var subtasks: Int
    public var weight: Decimal
    public var children: [String]?
}
```

### Benchmark #1 - Encoding single object

In this benchmark we are encoding 10,000 times single object. 

**Code**

Simple implementation with Swift Codable protocol looks like below.

```swift
let encoder = JSONEncoder()
let entity = TaskDto(id: UUID().uuidString, createDate: Date(), name: "Task 1", isFinished: false)

do {
    for _ in 1...10_000 {
        _ = try encoder.encode(entity)
    }
} catch {
    print("Error during serialization object to JSON: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 0.760        | 0.773        | 0.747        | **0.760**         | 6                   |
| Marshall      | 0.099        | 0.099        | 0.099        | **0.099**         | 3 :3rd_place_medal: |
| ObjectMapper  | 0.264        | 0.259        | 0.254        | **0.259**         | 4                   |
| PMJSON        | 0.051        | 0.051        | 0.050        | **0.051**         | 2 :2nd_place_medal: |
| Codable       | 0.304        | 0.301        | 0.303        | **0.303**         | 5                   |
| SwiftProtobuf | 0.044        | 0.043        | 0.042        | **0.043**         | 1 :1st_place_medal: |
| NetCore       | 0.027        | 0.027        | 0.026        | **0.027**         | -                   |


### Benchmark #2 - Encoding list of objects

In this benchmark we are encoding 10,000 times list of 100 objects. 

**Code**

Implementation with Swift Codable protocol looks like on below snippet.

```swift
let encoder = JSONEncoder()
let list = getListOfTasks() // Returns array of 100 tasks

do {
    for _ in 1...10_000 {
        _ = try encoder.encode(list)
    }
} catch {
    print("Error during serialization object to JSON: \(error)")
}
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 100.993      | 100.324      | 99.208       | **100.175**       | 6                   |
| Marshall      | 4.669        | 4.633        | 4.635        | **4.646**         | 2 :2nd_place_medal: |
| ObjectMapper  | 15.632       | 15.821       | 15.615       | **15.689**        | 4                   |
| PMJSON        | 4.730        | 4.726        | 4.749        | **4.73**          | 3 :3rd_place_medal: |
| Codable       | 19.584       | 19.373       | 19.344       | **19.43**         | 5                   |
| SwiftProtobuf | 4.161        | 4.176        | 4.263        | **4.200**         | 1 :1st_place_medal: |
| NetCore       | 1.785        | 1.790        | 1,787        | **1.787**         | -                   |

## Decoding (deserialization)

Benchmarks of algorithms which transform JSON to the corresponding object(s). JSON which is parsed looks like on below snippet.

```json
{
    "id": "e24e39c2-7b96-4a16-8cb6-bb96239171e5",
    "createDate": "2009-02-15T00:00:00Z",
    "name": "Task 1",
    "isFinished": false
}
```

### Benchmark #3 - Decoding single object

In this benchmark we are decoding 10,000 times JSON file which represent single object.

**Code**

Simple implementation with Swift Codable protocol.

```swift
    let decoder = JSONDecoder()
    let jsonData = getJsonData() // Returns Data object (with single JSON object)

    do {
        for _ in 1...10_000 {
            _ = try decoder.decode(TaskClassDto.self, from: jsonData)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 0.302        | 0.306        | 0.311        | **0.306**         | 3 :3rd_place_medal: |
| Marshall      | 0.562        | 0.560        | 0.566        | **0.563**         | 5                   |
| ObjectMapper  | 0.217        | 0.217        | 0.220        | **0.218**         | 2 :2nd_place_medal: |
| PMJSON        | 0.438        | 0.433        | 0.431        | **0.434**         | 4                   |
| Codable       | 0.795        | 0.782        | 0.788        | **0.788**         | 6                   |
| SwiftProtobuf | 0.049        | 0.047        | 0.049        | **0.048**         | 1 :1st_place_medal: |
| NetCore       | 0,100        | 0,101        | 0,101        | **0.101**         | -                   |

### Benchmark #4 - Decoding list of objects

In this benchmark we are decoding 10,000 times JSON file which represent 100 objects.

**Code**

Simple implementation with Swift Codable protocol.

```swift
    let decoder = JSONDecoder()
    let jsonListData = getJsonListData() // Returns Data object (with list of JSON objects)

    do {
        for _ in 1...10_000 {
            _ = try decoder.decode([TaskClassDto].self, from: jsonListData)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
```

**Results**

| Framework     | Run #1 (sec) | Run #2 (sec) | Run #3 (sec) | **Average (sec)** | Ranking             |
|---------------|--------------|--------------|--------------|-------------------|---------------------|
| HandyJSON     | 22.775       | 22.495       | 22.568       | **22.619**        | 3 :3rd_place_medal: |
| Marshall      | 49.990       | 51.086       | 49.885       | **50.320**        | 5                   |
| ObjectMapper  | 14.330       | 14.475       | 14.170       | **14.325**        | 2 :2nd_place_medal: |
| PMJSON        | 39.526       | 39.724       | 39.513       | **39.588**        | 4                   |
| Codable       | 77.687       | 72.703       | 73.567       | **74.652**        | 6                   |
| SwiftProtobuf | 2.361        | 2.369        | 2.389        | **2.373**         | 1 :1st_place_medal: |
| NetCore       | 2,378        | 2,369        | 2,354        | **2.367**         | -                   |

## Contributing

If you would like to add another framework for comparison, submit a pull request. Add folder with new benchmark implementation (we have separate application for each framework). Add new framework to `build.sh` and `run.sh` scripts.