import Foundation
import ObjectMapper

class TaskClassDto: Mappable {

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

    required init?(map: Map) {
        self.id = nil
        self.createDate = nil
        self.name = ""
        self.isFinished = false
    }

    func mapping(map: Map) {
        self.id             <- map["id"]
        self.createDate     <- map["createDate"]
        self.name           <- map["name"]
        self.isFinished     <- map["isFinished"]
    }

    init(id: String, createDate: Date, name: String, isFinished: Bool) {
        self.id = id
        self.createDate = createDate
        self.name = name
        self.isFinished = isFinished
    }
}
