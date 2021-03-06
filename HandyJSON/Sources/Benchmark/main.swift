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
        list.append(
            TaskClassDto(
                id: UUID().uuidString,
                createDate: currentDate,
                name: "Task \(i)",
                isFinished: false,
                subtasks: 212,
                weight: 3.14,
                children: ["taska", "taskb", "taskc"],
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis.",
                deadline: currentDate,
                tags: ["tag1", "tag2", "tag3", "tag4", "tag5"]
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
        children: ["taska", "taskb", "taskc"],
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis.",
        deadline: Date(),
        tags: ["tag1", "tag2", "tag3", "tag4", "tag5"]
    )
}

var entityJson = TaskJson.getTaskJson()
var listJson = TaskJson.getTasksJson()

var entity = getObject()
var list = getList()

print("Running benchmarks for HandyJSON:")

// Encoding single object 10,000 times.
evaluateProblem("#1 Encoding (single object)") {
    for _ in 1...10_000 {
        _ = entity.toJSONString()
    }
}

// Encoding list of objects 10,000 times.
evaluateProblem("#2 Encoding (list of objects)") {
    for _ in 1...10_000 {
        _ = list.toJSONString()
    }
}

// Decoding single object 10,000 times.
evaluateProblem("#3 Decoding (single object)") {
    for _ in 1...10_000 {
        _ = TaskClassDto.deserialize(from: entityJson)
    }
}

// Decoding list of objects 10,000 times.
evaluateProblem("#4 Decoding (list of objects)") {
    for _ in 1...10_000 {
        _ = [TaskClassDto].deserialize(from: listJson)
    }
}
