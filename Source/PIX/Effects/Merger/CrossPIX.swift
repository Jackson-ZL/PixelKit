//
//  CrossPIX.swift
//  Pixels
//
//  Created by Hexagons on 2018-08-21.
//  Copyright © 2018 Hexagons. All rights reserved.
//

import CoreGraphics

public class CrossPIX: PIXMergerEffect, PIXofaKind {
    
    let kind: PIX.Kind = .cross
    
    override var shader: String { return "effectMergerCrossPIX" }
    
    public var crossFraction: CGFloat = 0.5 { didSet { setNeedsRender() } }
    enum CrossCodingKeys: String, CodingKey {
        case crossFraction
    }
    override var uniforms: [CGFloat] {
        return [crossFraction, CGFloat(fillMode.index)]
    }
    
    public override init() {
        super.init()
    }
    
    // MARK: JSON
    
    required convenience init(from decoder: Decoder) throws { self.init() }
    
    public override func encode(to encoder: Encoder) throws {}
    
    
}
