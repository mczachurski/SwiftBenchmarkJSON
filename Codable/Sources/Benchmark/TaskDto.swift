import Foundation

class TaskClassDto: Codable {

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
}
