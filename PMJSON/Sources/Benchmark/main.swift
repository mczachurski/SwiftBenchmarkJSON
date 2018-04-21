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
    let currentDate = Date()
    var list: [TaskClassDto] = []
    for i in 1...100 {
        list.append(TaskClassDto(id: UUID(), createDate: currentDate, name: "Task \(i)", isFinished: false))
    }

    return list
}

func getObject() -> TaskClassDto {
    return TaskClassDto(id: UUID(), createDate: Date(), name: "Task 1", isFinished: false)
}

var entityJson = TaskJson.getTaskJson()
var listJson = TaskJson.getTasksJson()

var entity = getObject()
var list = getList()

print("Running benchmarks for PMJSON:")

// Encoding single object 100 000 times.
evaluateProblem("#1 Encoding (single object)") {
    let encoder = JSON.Encoder()

    do {
        for _ in 1...100_000 {
            _ = try encoder.encodeAsJSON(entity)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Encoding list of objects 100 000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    let encoder = JSON.Encoder()

    do {
        for _ in 1...100_000 {
            _ = try encoder.encodeAsJSON(list)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Decoding single object 100 000 times.
evaluateProblem("#3 Decoding (single object)") {
    do {
        for _ in 1...100_000 {
            let json = try JSON.decode(entityJson)
            _ = try TaskClassDto(json: json)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Decoding list of objects 100 000 times.
evaluateProblem("#4 Decoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            let json = try JSON.decode(listJson)
            switch(json) {
            case .array(let array):
                for item in array {
                    _ = try TaskClassDto(json: item)
                }
            default:
                print("Error during serializable object to JSON")    
            }
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}
