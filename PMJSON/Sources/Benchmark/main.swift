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
        list.append(
            TaskClassDto(
                id: UUID().uuidString,
                createDate: currentDate,
                name: "Task \(i)",
                isFinished: false,
                subtasks: 212,
                weight: 3.14,
                children: ["taska", "taskb", "taskc"]
            )
        )
    }

    return list
}

func getObject() -> TaskClassDto {
    return TaskClassDto(
        id: UUID().uuidString,
        createDate: Date(),
        name: "Task 1",
        isFinished: false,
        subtasks: 212,
        weight: 3.14,
        children: ["taska", "taskb", "taskc"]
    )
}

var entityJson = TaskJson.getTaskJson()
var listJson = TaskJson.getTasksJson()

var entity = getObject()
var list = getList()

print("Running benchmarks for PMJSON:")

// Encoding single object 10,000 times.
evaluateProblem("#1 Encoding (single object)") {
    var encoder = JSON.Encoder()
    encoder.dateEncodingStrategy = .iso8601

    do {
        for _ in 1...10_000 {
            _ = try encoder.encodeAsString(entity)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Encoding list of objects 10,000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    var encoder = JSON.Encoder()
    encoder.dateEncodingStrategy = .iso8601

    do {
        for _ in 1...10_000 {
            _ = try encoder.encodeAsString(list)
        }
    } catch {
        print("Error during serialization object to JSON: \(error)")
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 Decoding (single object)") {
    var decoder = JSON.Decoder()
    decoder.dateDecodingStrategy = .iso8601

    do {
        for _ in 1...10_000 {
            _ = try decoder.decode(TaskClassDto.self, from: entityJson)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}

// Decoding list of objects 10,000 times.
evaluateProblem("#4 Decoding (list of objects)") {
    var decoder = JSON.Decoder()
    decoder.dateDecodingStrategy = .iso8601

    do {
        for _ in 1...10_000 {
            _ = try decoder.decode([TaskClassDto].self, from: listJson)
        }
    } catch {
        print("Error during deserialization object from JSON: \(error)")
    }
}
