import Foundation

extension Date {
    var short: String {
        let interval = Calendar.current.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute], from: self, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"

         if let years = interval.year, years > 0 {
             formatter.dateFormat = "dd.MM.yyyy"
             return " · \(formatter.string(from: self))"
         } else if let months = interval.month, months > 0 {
             formatter.dateFormat = "dd MMMM"
             return " · \(formatter.string(from: self))"
         } else if let weeks = interval.weekOfYear, weeks > 0 {
             return " · \(weeks)нед"
         } else if let days = interval.day, days > 0 {
             return " · \(days)д"
         } else if let hours = interval.hour, hours > 0 {
             return " · \(hours)ч"
         } else if let minutes = interval.minute, minutes > 0 {
             return " · \(minutes)м"
         } else {
             return ""
         }
    }
}
