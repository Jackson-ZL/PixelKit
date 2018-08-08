//
//  PIXEffect.swift
//  HxPxE
//
//  Created by Hexagons on 2018-07-26.
//  Copyright © 2018 Hexagons. All rights reserved.
//

import Foundation

public class PIXEffect: PIX, PIXIn, PIXOut {
    
    public var outPixs: [PIX & PIXIn] { return pixOutList! }
    
    override init() {
        super.init()
        pixInList = []
        pixOutList = []
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("PIXEffect Decoder Initializer is not supported.") // CHECK
    }
    
}
