import Foundation

extension Int {
    var digitCount: Int {
        self > 0 ? String(self).count : String(self).count - 1
    }
}

extension UInt {
    var digitCount: UInt {
        UInt(String(self).count)
    }
}
