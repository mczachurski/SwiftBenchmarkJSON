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

    required init() {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
        self.subtasks = 0
        self.weight = 1.0
        self.children = nil
    }

    required init?(map: Map) {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
        self.subtasks = 0
        self.weight = 1.0
        self.children = nil
    }

    func mapping(map: Map) {
        self.id             <- map["id"]
        self.createDate     <- (map["createDate"], ISO8601DateTransform())
        self.name           <- map["name"]
        self.isFinished     <- map["isFinished"]
        self.subtasks       <- map["subtasks"]
        self.weight         <- map["weight"]
        self.children       <- map["children"]
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
}
