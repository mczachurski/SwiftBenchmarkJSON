import Foundation

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
        task.createDate = Date().description
        task.name = "Task \(i)"
        task.isFinished = false

        tasks.tasks.append(task)
    }

    return tasks
}

func getObject() -> Task {

    var task = Task()
    task.id = UUID().uuidString
    task.createDate = Date().description
    task.name = "Task 1"
    task.isFinished = false

    return task
}

var object = getObject()
var list = getList()

var objectJson = try! object.jsonString()
var listJson = try! list.jsonString()
var objectData = try! object.serializedData()
var listData = try! list.serializedData()

print("Running benchmarks for SwiftProtobuf:")

// Encoding single object 100 000 times.
evaluateProblem("#1 (JSON) Encoding (single object)") {
    do {
        for _ in 1...100_000 {
            _ = try object.jsonString()
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Encoding single object 100 000 times.
evaluateProblem("#1 (Binary) Encoding (single object)") {
    do {
        for _ in 1...100_000 {
            _ = try object.serializedData()
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Encoding list of objects 100 000 times (JSON).
evaluateProblem("#2 (JSON) Encoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            _ = try list.jsonString()
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Encoding list of objects 100 000 times (binary).
evaluateProblem("#2 (Binary) Encoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            _ = try list.serializedData()
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Decoding single object 100 000 times.
evaluateProblem("#3 (JSON) Decoding (single object)") {
    do {
        for _ in 1...100_000 {
            _ = try Task(jsonString: objectJson)
        }
    } catch {
        print("Error during serializable object to JSON: \(error)")
    }
}

// Decoding single object 100 000 times.
evaluateProblem("#3 (Binary) Decoding (single object)") {
    do {
        for _ in 1...100_000 {
            _ = try Task(serializedData: objectData)
        }
    } catch {
        print("Error during serializable object to JSON: \(error)")
    }
}

// Decoding list of objects 100 000 times (JSON).
evaluateProblem("#4 (JSON) Decoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            _ = try Tasks(jsonString: listJson)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Decoding list of objects 100 000 times (binary).
evaluateProblem("#4 (Binary) Decoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            _ = try Tasks(serializedData: listData)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}