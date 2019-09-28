//
//  Space.swift
//  Nip
//
//  Created by Public on 9/28/19.
//  Copyright © 2019 Public. All rights reserved.
//

import Cocoa

class SpaceView: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        print("SpaceView.draw")
        
        let gradient = NSGradient.init(starting: NSColor.darkGray, ending: NSColor.gray)
        gradient?.draw(in: dirtyRect, angle: 90.0)
        
    }
}
