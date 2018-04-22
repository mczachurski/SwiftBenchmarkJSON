import Foundation

class DateHelper {
    private static let formatter = DateFormatter()

    public static func fromISO8601String(_ dateString: String) -> Date? {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.date(from: dateString)
    }

    public static func toISO8601String(_ date: Date?) -> String? {

        guard let dateValue = date else {
            return nil
        }

        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.string(from: dateValue)
    }
} 
            
            