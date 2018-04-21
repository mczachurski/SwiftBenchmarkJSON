import Foundation
import Marshal

class TaskClassDto: Marshaling {

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

    init(id: Foundation.UUID, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }

    func marshaled() -> [String: Any] {
        return [
            "id": id?.uuidString ?? "",
            "createDate" : createDate?.description ?? "",
            "name": name,
            "isFinished": isFinished
        ]
    }
}
