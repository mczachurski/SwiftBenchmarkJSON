import Foundation
import PMJSON

func evaluateProblem(_ name: String, method: () -> Void) {

    let start = DispatchTime.now()
    method()
    let end = DispatchTime.now()

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000 

    print("    \(name): \(timeInterval) seconds")
}

func getList() -> [TaskClassDto] {
    let currentDate = Date().description
    var list: [TaskClassDto] = []
    for i in 1...100 {
        list.append(TaskClassDto(id: UUID().uuidString, createDate: currentDate, name: "Task \(i)", isFinished: false))
    }

    return list
}

func getObject() -> TaskClassDto {
    return TaskClassDto(id: UUID().uuidString, createDate: Date().description, name: "Task 1", isFinished: false)
}

var entityJson = TaskJson.getTaskJson()
var listJson = TaskJson.getTasksJson()

var entity = getObject()
var list = getList()

print("Running benchmarks for PMJSON:")

// Encoding single object 10,000 times.
evaluateProblem("#1 Encoding (single object)") {
    let encoder = JSON.Encoder()

    do {
        for _ in 1...10_000 {
            _ = try encoder.encodeAsJSON(entity)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding list of objects 10,000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    let encoder = JSON.Encoder()

    do {
        for _ in 1...10_000 {
            _ = try encoder.encodeAsJSON(list)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 Decoding (single object)") {
    do {
        for _ in 1...10_000 {
            let json = try JSON.decode(entityJson)
            _ = try TaskClassDto(json: json)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding list of objects 10,000 times.
evaluateProblem("#4 Decoding (list of objects)") {
    do {
        for _ in 1...10_000 {
            let json = try JSON.decode(listJson)
            switch(json) {
            case .array(let array):
                for item in array {
                    _ = try TaskClassDto(json: item)
                }
            default:
                print("Not correct type!") 
            }
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}
