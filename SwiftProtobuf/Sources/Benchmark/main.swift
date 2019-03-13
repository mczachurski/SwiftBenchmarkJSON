import Foundation
import SwiftProtobuf

func evaluateProblem(_ name: String, method: () -> Void) {

    let start = DispatchTime.now()
    method()
    let end = DispatchTime.now()

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000 

    print("    \(name): \(timeInterval) seconds")
}

func getList() -> Tasks {
    var tasks = Tasks()

    for i in 1...100 {

        var task = Task()
        task.id = UUID().uuidString
        task.createDate = SwiftProtobuf.Google_Protobuf_Timestamp(date: Date())
        task.name = "Task \(i)"
        task.isFinished = false
        task.subtasks = 212
        task.weight = 3.14
        task.children = ["taska", "taskb", "taskc"]
        task.description_p = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis."
        task.deadline = SwiftProtobuf.Google_Protobuf_Timestamp(date: Date())
        task.tags = ["tag1", "tag2", "tag3", "tag4", "tag5"]

        tasks.tasks.append(task)
    }

    return tasks
}

func getObject() -> Task {

    var task = Task()
    task.id = UUID().uuidString
    task.createDate = SwiftProtobuf.Google_Protobuf_Timestamp(date: Date())
    task.name = "Task 1"
    task.isFinished = false
    task.subtasks = 212
    task.weight = 3.14
    task.children = ["taska", "taskb", "taskc"]
    task.description_p = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis."
    task.deadline = SwiftProtobuf.Google_Protobuf_Timestamp(date: Date())
    task.tags = ["tag1", "tag2", "tag3", "tag4", "tag5"]

    return task
}

var object = getObject()
var list = getList()

var objectJson = try! object.jsonString()
var listJson = try! list.jsonString()

var objectData = try! object.serializedData()
var listData = try! list.serializedData()

print("Running benchmarks for SwiftProtobuf:")

// Encoding single object 10,000 times.
evaluateProblem("#1 (JSON) Encoding (single object)") {
    do {
        for _ in 1...10_000 {
            _ = try object.jsonString()
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding single object 10,000 times.
evaluateProblem("#1 (Binary) Encoding (single object)") {
    do {
        for _ in 1...10_000 {
            _ = try object.serializedData()
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding list of objects 10,000 times (JSON).
evaluateProblem("#2 (JSON) Encoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            _ = try list.jsonString()
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding list of objects 10,000 times (binary).
evaluateProblem("#2 (Binary) Encoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            _ = try list.serializedData()
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 (JSON) Decoding (single object)") {
    do {
        for _ in 1...10_000 {
            _ = try Task(jsonString: objectJson)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 (Binary) Decoding (single object)") {
    do {
        for _ in 1...10_000 {
            _ = try Task(serializedData: objectData)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding list of objects 10,000 times (JSON).
evaluateProblem("#4 (JSON) Decoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            _ = try Tasks(jsonString: listJson)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding list of objects 10,000 times (binary).
evaluateProblem("#4 (Binary) Decoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            _ = try Tasks(serializedData: listData)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}
