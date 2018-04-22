import Foundation

class TaskClassDto: Codable {

    public var id: String?
    public var createDate: Date?
    public var name: String
    public var isFinished: Bool

    init(id: String, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }
}
