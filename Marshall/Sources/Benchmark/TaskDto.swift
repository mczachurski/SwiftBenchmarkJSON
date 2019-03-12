import Foundation
import Marshal

class TaskClassDto: Marshaling, Unmarshaling {

    public var id: String?
    public var createDate: Date?
    public var name: String
    public var isFinished: Bool
    public var subtasks: Int
    public var weight: Double
    public var children: [String]?

    required init() {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
        self.subtasks = 0
        self.weight = 1.0
        self.children = nil
    }

    init(id: String, createDate: Date, name: String, isFinished: Bool, subtasks: Int, weight: Double, children: [String]) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
        self.subtasks = subtasks
        self.weight = weight
        self.children = children
    }

    required init(object: MarshaledObject) throws {
        id = try object.value(for: "id")
        createDate = try object.value(for: "createDate")
        name = try object.value(for: "name")
        isFinished = try object.value(for: "isFinished")
        subtasks = try object.value(for: "subtasks")
        weight = try object.value(for: "weight")
        children = try object.value(for: "children")
    }

    func marshaled() -> [String: Any?] {
        return [
            "id": id ?? "",
            "createDate" : DateHelper.toISO8601String(createDate),
            "name": name,
            "isFinished": isFinished,
            "subtasks": subtasks,
            "weight": weight,
            "children": children
        ]
    }
}
