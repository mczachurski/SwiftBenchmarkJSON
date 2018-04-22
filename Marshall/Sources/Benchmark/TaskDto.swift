import Foundation
import Marshal

class TaskClassDto: Marshaling, Unmarshaling {

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

    init(id: String, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }

    required init(object: MarshaledObject) throws {
        id = try object.value(for: "id")
        createDate = try object.value(for: "createDate")
        name = try object.value(for: "name")
        isFinished = try object.value(for: "isFinished")
    }

    func marshaled() -> [String: Any] {
        return [
            "id": id ?? "",
            "createDate" : DateHelper.toISO8601String(createDate) ?? "",
            "name": name,
            "isFinished": isFinished
        ]
    }
}
