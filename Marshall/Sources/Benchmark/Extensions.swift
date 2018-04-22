import Foundation
import Marshal

extension Date : ValueType {
    public static func value(from object: Any) throws -> Date {
        guard let dateString = object as? String else {
            throw MarshalError.typeMismatch(expected: String.self, actual: type(of: object))
        }

        guard let date = DateHelper.fromISO8601String(dateString) else {
            throw MarshalError.typeMismatch(expected: "ISO8601 date string", actual: dateString)
        }

        return date
    }
}

class DateHelper {
    private static let formatter = DateFormatter()

    public static func fromISO8601String(_ dateString: String) -> Date? {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: dateString)
    }

    public static func toISO8601String(_ date: Date?) -> String? {

        guard let dateValue = date else {
            return nil
        }

        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.string(from: dateValue)
    }
} 
            
            