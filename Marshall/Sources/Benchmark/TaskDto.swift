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
    public var description: String?
    public var deadline: Date?
    public var tags: [String]?

    required init() {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
        self.subtasks = 0
        self.weight = 1.0
        self.children = nil
        self.description = ""
        self.deadline = nil
        self.tags = nil
    }

    init(
        id: String,
        createDate: Date,
        name: String,
        isFinished: Bool,
        subtasks: Int,
        weight: Double,
        children: [String],
        description: String?,
        deadline: Date?,
        tags: [String]?
    ) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
        self.subtasks = subtasks
        self.weight = weight
        self.children = children
        self.description = description
        self.deadline = deadline
        self.tags = tags
    }

    required init(object: MarshaledObject) throws {
        id = try object.value(for: "id")
        createDate = try object.value(for: "createDate")
        name = try object.value(for: "name")
        isFinished = try object.value(for: "isFinished")
        subtasks = try object.value(for: "subtasks")
        weight = try object.value(for: "weight")
        children = try object.value(for: "children")
        description = try object.value(for: "description")
        deadline = try object.value(for: "deadline")
        tags = try object.value(for: "tags")
    }

    func marshaled() -> [String: Any?] {
        return [
            "id": id ?? "",
            "createDate" : DateHelper.toISO8601String(createDate),
            "name": name,
            "isFinished": isFinished,
            "subtasks": subtasks,
            "weight": weight,
            "children": children,
            "description": description,
            "deadline": DateHelper.toISO8601String(deadline),
            "tags": tags
        ]
    }
}
