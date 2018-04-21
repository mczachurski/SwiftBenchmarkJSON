import Foundation
import HandyJSON

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

var entity = getObject()
var list = getList()

print("Running benchmarks for HandyJSON:")

// Encoding single object 100 000 times.
evaluateProblem("#1 Encoding (single object)") {
    for _ in 1...100_000 {
        _ = entity.toJSONString()
    }
}

// Encoding list of objects 100 000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    for _ in 1...100_000 {
        _ = list.toJSONString()
    }
}
