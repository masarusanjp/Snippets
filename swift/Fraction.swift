import Foundation

struct Fraction: Comparable, Equatable, Codable, Hashable {
    static func < (lhs: Fraction, rhs: Fraction) -> Bool {
        if lhs.decimal == rhs.decimal {
            if lhs.denominator == rhs.denominator {
                return lhs.numerator < rhs.numerator
            } else {
                return lhs.denominator < rhs.denominator
            }
        } else {
            return lhs.decimal < rhs.decimal
        }
    }

    static func == (lhs: Fraction, rhs: Fraction) -> Bool {
        lhs.decimal == rhs.decimal
    }

    var numerator: Int
    var denominator: Int
    var decimal: Decimal {
        Decimal(numerator) / Decimal(denominator)
    }
    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    var reduction: Fraction {
        let c = Self.gcd(a: numerator, b: denominator)
        if c > 1 {
            return Fraction(numerator: numerator / c, denominator: denominator / c)
        } else {
            return self
        }
    }
}
