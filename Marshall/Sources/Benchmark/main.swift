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
        list.append(TaskClassDto(id: UUID(), createDate: currentDate, name: "Task \(i)", isFinished: false))
    }

    return list
}

func getObject() -> [String: Any] {
    let entity = TaskClassDto(id: UUID(), createDate: Date(), name: "Task 1", isFinished: false)
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

var entity = getObject()
var dictionary = getDictionary()

print("Running benchmarks for Marshall:")

// Encoding single object 100 000 times.
evaluateProblem("#1 Encoding (single object)") {
    do {
        for _ in 1...100_000 {
            _ = try JSONSerialization.data(withJSONObject: entity)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}

// Encoding list of objects 100 000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    do {
        for _ in 1...100_000 {
            _ = try JSONSerialization.data(withJSONObject: dictionary)
        }
    } catch {
        print("Error during serializable object to JSON")
    }
}
