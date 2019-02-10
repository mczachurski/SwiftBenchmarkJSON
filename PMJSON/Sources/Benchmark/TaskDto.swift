import Foundation
import PMJSON

class TaskClassDto: Encodable {

    public var id: String?
    public var createDate: String?
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
        createDate = try json.getStringOrNil("createDate")
        name = try json.getString("name")
        isFinished = try json.getBool("isFinished")
    }

    init(id: String, createDate: String, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }
}
