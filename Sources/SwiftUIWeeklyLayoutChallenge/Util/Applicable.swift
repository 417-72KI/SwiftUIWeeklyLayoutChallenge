import Foundation

public protocol Applicable {
}

public extension Applicable where Self: AnyObject {
    @discardableResult
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Applicable {}
