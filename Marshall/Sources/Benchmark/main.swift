import Foundation
import Marshal

func evaluateProblem(_ name: String, method: () -> Void) {

    let start = DispatchTime.now()
    method()
    let end = DispatchTime.now()

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000 

    print("    \(name): \(timeInterval) seconds")
}

func getList() -> [TaskClassDto] {
    let currentDate = Date()
    var list: [TaskClassDto] = []
    for i in 1...100 {
        list.append(TaskClassDto(id: UUID().uuidString, createDate: currentDate, name: "Task \(i)", isFinished: false))
    }

    return list
}

func getObject() -> [String: Any] {
    let entity = TaskClassDto(id: UUID().uuidString, createDate: Date(), name: "Task 1", isFinished: false)
    return entity.marshaled()
}

func getDictionary() -> [Any] {
    let list = getList()
    var dict: [Any] = []

    for item in list {
        dict.append(item.marshaled())
    }

    return dict;
}

var entityJson = TaskJson.getTaskJson()
var listJson = TaskJson.getTasksJson()

var entity = getObject()
var dictionary = getDictionary()

print("Running benchmarks for Marshall:")

// Encoding single object 10,000 times.
evaluateProblem("#1 Encoding (single object)") {
    do {
        for _ in 1...10_000 {
            _ = try JSONSerialization.data(withJSONObject: entity)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding list of objects 10,000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            _ = try JSONSerialization.data(withJSONObject: dictionary)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 Decoding (single object)") {
    do {
        for _ in 1...10_000 {
            let json = try JSONSerialization.jsonObject(with: entityJson, options: []) as! MarshaledObject
            _ = try TaskClassDto(object: json)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding list of objects 10,000 times.
evaluateProblem("#4 Decoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            let json = try JSONSerialization.jsonObject(with: listJson, options: []) as! [MarshaledObject]
            for item in json {
                _ = try TaskClassDto(object: item)
            }
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}
