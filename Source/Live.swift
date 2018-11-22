//
//  Live.swift
//  Pixels
//
//  Created by Hexagons on 2018-11-20.
//  Copyright © 2018 Hexagons. All rights reserved.
//

import Foundation
import CoreGraphics

public /*private*/ class Live {
    
    public static let now = Live()
    
    let start = Date()
    
//    public var touch: LivePoint?
//    public var touchDown: LiveBool
//    public var multiTouch: LivePointArray
//    public var mouse: LivePoint
//    public var mouseLeft: LiveBool
//    public var mouseRight: LiveBool
//
//    public var darkMode: LiveBool
//
//    public var year: LiveInt!
//    public var month: LiveInt!
//    public var day: LiveInt!
//    public var hour: LiveInt!
//    public var minute: LiveInt!
//    public var second: LiveInt!
    
    let lf: LiveFloat
    
    init() {
        lf = .secondsSinceLaunch
    }
    
    public func test() {
        print(lf)
    }
    
}

protocol LiveValue {
    
    var futureValue: () -> (CGFloat) { get set }
    var value: CGFloat { get }
    
    var liveValue: CGFloat { mutating get }
    var liveIsNew: Bool { get }
    var liveLast: CGFloat? { get set }
    
}

protocol LiveValueConvertable {
//    func *(lhs: Self, rhs: Self) -> Self
    init(_: FloatLiteralType)
}

//extension Double : LiveValueConvertable {}
//extension Float : LiveValueConvertable {}
//extension CGFloat : LiveValueConvertable {}

public struct LiveFloat: LiveValue, Equatable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, CustomStringConvertible {
    
//    public typealias FloatLiteralType = Double
//    public typealias IntegerLiteralType = Int
    
    public var description: String {
        return "live(\(value))"
    }
    
//    public typealias NativeType = CGFloat
//    public var native: LiveFloat.NativeType
    
    
    var futureValue: () -> (CGFloat)
    public var value: CGFloat {
        return futureValue()
    }
    
    var liveValue: CGFloat {
        mutating get {
            liveLast = value
            return value
        }
    }
    var liveIsNew: Bool {
        return liveLast != value
    }
    var liveLast: CGFloat? = nil
    
    
    //    public var years: LiveFloat!
    //    public var months: LiveFloat!
    //    public var days: LiveFloat!
    //    public var hours: LiveFloat!
    //    public var minutes: LiveFloat!
    //    public var seconds: LiveFloat!
    public static var secondsSinceLaunch: LiveFloat {
        return LiveFloat({ () -> (CGFloat) in
            return Pixels.main.seconds
        })
    }
    public static var secondsSince1970: LiveFloat {
        return LiveFloat({ () -> (CGFloat) in
            return CGFloat(-Date().timeIntervalSince1970)
        })
    }

    
    public init(_ futureValue: @escaping () -> (CGFloat)) {
        self.futureValue = futureValue
        
    }
    
    public init(floatLiteral value: FloatLiteralType) {
        futureValue = { return CGFloat(value) }
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        futureValue = { return CGFloat(value) }
    }
    
//    public init(_ value: Double) {
//        futureValue = { return CGFloat(value) }
//    }
    
//    func filter(for seconds: LiveFloat) -> LiveFloat {
//        // ...
//    }
    
    public static func == (lhs: LiveFloat, rhs: LiveFloat) -> Bool {
        return lhs.value == rhs.value
    }
    
    public static func + (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return lhs.value + rhs.value })
    }
    public static func - (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return lhs.value - rhs.value })
    }
    
    public static func * (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return lhs.value * rhs.value })
    }
    public static func / (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return lhs.value / rhs.value })
    }
    
    public static func ** (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return pow(lhs.value, rhs.value) })
    }
    public static func !** (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return pow(lhs.value, 1.0 / rhs.value) })
    }
    
    public static func <> (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return min(lhs.value, rhs.value) })
    }
    public static func >< (lhs: LiveFloat, rhs: LiveFloat) -> LiveFloat {
        return LiveFloat({ return max(lhs.value, rhs.value) })
    }
    
    public prefix static func - (operand: LiveFloat) -> LiveFloat {
        return LiveFloat({ return -operand.value })
    }
    
//    static func pow(_ value: LiveFloat, _ powerValue: LiveFloat) {
//        return LiveFloat({ return pow(value, powerValue) })
//    }
    
}
