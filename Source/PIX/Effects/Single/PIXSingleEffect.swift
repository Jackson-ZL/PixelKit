//
//  PIXSingleEffect.swift
//  Pixels
//
//  Created by Hexagons on 2018-07-31.
//  Copyright © 2018 Hexagons. All rights reserved.
//

import CoreGraphics

public class PIXSingleEffect: PIXEffect, PIXInSingle {
    
    public var inPix: (PIX & PIXOut)? { didSet { setNeedsConnect() } }
    
//    override init(id: UUID) {
//        super.init(id: id)
//    }
//    init(from decoder: Decoder) throws {
//        self.init(id: id)
////        try super.init(from: decoder)
//    }

//    required init(from decoder: Decoder) throws {
//        try super.init(from: decoder)
//    }
    
//    required init(from decoder: Decoder) throws {
//        fatalError("PIXSingleEffect Decoder Initializer is not supported.") // CHECK
//    }
    
}
