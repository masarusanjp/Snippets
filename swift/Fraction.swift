import Foundation

struct Fraction {
    var numerator: Int
    var denominator: Int
    var decimal: Decimal {
        Decimal(numerator) / Decimal(denominator)
    }

    var reduction: Fraction {
        let c = Self.gcd(a: numerator, b: denominator)
        if c > 1 {
            return Fraction(numerator: numerator / c, denominator: denominator / c)
        } else {
            return self
        }
    }

    private static func gcd(a: Int, b: Int) -> Int {
        assert(a != 0 && b != 0)
        var i = a, j = b
        
        if i < j {
            swap(&i, &j)
         }

        while true {
            let l = i % j
            if l == 0 {
                break
            }
            i = j
            j = l
        }
        
        return abs(j)
    }
}

extension Fraction: Codable {}
extension Fraction: Hashable {}

extension Fraction: Equatable {    
    static func == (lhs: Fraction, rhs: Fraction) -> Bool {
        lhs.decimal == rhs.decimal
    }
}

extension Fraction: Comparable {
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
}
