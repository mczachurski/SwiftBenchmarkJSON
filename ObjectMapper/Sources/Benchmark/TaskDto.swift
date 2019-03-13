import Foundation
import ObjectMapper

class TaskClassDto: Mappable {

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

    required init?(map: Map) {
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

    func mapping(map: Map) {
        self.id             <- map["id"]
        self.createDate     <- (map["createDate"], ISO8601DateTransform())
        self.name           <- map["name"]
        self.isFinished     <- map["isFinished"]
        self.subtasks       <- map["subtasks"]
        self.weight         <- map["weight"]
        self.children       <- map["children"]
        self.description    <- map["description"]
        self.deadline       <- (map["deadline"], ISO8601DateTransform())
        self.tags           <- map["tags"]
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
}
