import Foundation
import PMJSON

class TaskClassDto: Encodable {

    public var id: Foundation.UUID?
    public var createDate: Date?
    public var name: String
    public var isFinished: Bool

    required init() {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
    }

    init(json: JSON) throws {
        if let idValue = try json.getStringOrNil("id") {
            id = UUID(uuidString: idValue)
        }
        if let createDateValue = try json.getStringOrNil("createDate") {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            createDate = formatter.date(from: createDateValue)
        }

        name = try json.getString("name")
        isFinished = try json.getBool("isFinished")
    }

    init(id: Foundation.UUID, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }
}
