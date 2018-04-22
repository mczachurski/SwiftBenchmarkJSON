import Foundation
import PMJSON

class TaskClassDto: Encodable {

    public var id: String?
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

        id = try json.getStringOrNil("id")

        if let createDateValue = try json.getStringOrNil("createDate") {
            createDate = DateHelper.fromISO8601String(createDateValue)
        }

        name = try json.getString("name")
        isFinished = try json.getBool("isFinished")
    }

    init(id: String, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }
}
