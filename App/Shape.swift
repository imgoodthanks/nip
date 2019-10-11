//
//  Shape.swift
//  Nip
//
//  Created by Public on 9/29/19.
//  Copyright © 2019 Public. All rights reserved.
//

import Cocoa

class Shape : NSObject {
    
    // a relative origin point
    var origin = CGPoint(x: 0, y: 0)
    
    init(origin: CGPoint) {
        print("\(origin)")
        self.origin = origin
    }
}
