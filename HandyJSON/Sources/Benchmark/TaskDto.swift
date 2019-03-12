import Foundation
import HandyJSON

class TaskClassDto: HandyJSON {

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

    func mapping(mapper: HelpingMapper) {
        mapper <<< createDate <-- CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ssZ")
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
