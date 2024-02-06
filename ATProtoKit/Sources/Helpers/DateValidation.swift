import Foundation

public struct ATProtocolDate: Codable, Hashable, Equatable, Sendable {
    
    public let date: Date
    
    public var toDate: Date {
        // Conversion logic here
        // ATProtocolDate is a wrapper around Date:
        return self.date
    }

    public init(date: Date) {
        self.date = date
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)

        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        // List of possible date formats
        let dateFormats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",            // Millisecond precision with Z
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ",         // Microsecond precision with Z
            "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX",        // Millisecond precision with timezone offset
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX",     // Microsecond precision with timezone offset
            "yyyy-MM-dd'T'HH:mm:ssZ",                // Whole seconds with Z
            "yyyy-MM-dd'T'HH:mm:ssXXXXX",            // Whole seconds with timezone offset
            "yyyy-MM-dd'T'HH:mm:ss.SZ",              // Single fractional second digit with Z
            "yyyy-MM-dd'T'HH:mm:ss.SXXXXX",          // Single fractional second digit with timezone offset
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSSSSSSZ",  // Extended precision with Z
            "yyyy-MM-dd'T'HH:mm:ss.SSS",             // Millisecond precision without timezone
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSS",          // Microsecond precision without timezone
            "yyyy-MM-dd'T'HH:mm:ss"                 // Whole seconds without timezone
        ]

        var date: Date?
        for dateFormat in dateFormats {
            formatter.dateFormat = dateFormat
            if let parsedDate = formatter.date(from: dateString) {
                date = parsedDate
                break
            }
        }

        guard let validDate = date else {
            throw DecodingError.dataCorruptedError(in: container,
                debugDescription: "Date string does not match any expected format.")
        }

        self.date = validDate
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        let dateString = formatter.string(from: self.date)
        try container.encode(dateString)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }


}
