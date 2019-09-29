//
//  Space.swift
//  Nip
//
//  Created by Public on 9/28/19.
//  Copyright © 2019 Public. All rights reserved.
//

import Cocoa

let DOUBLE_CLICK_COUNT = 2

class Space: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        print("Space.draw")
        
        // draw the background
        let gradient = NSGradient.init(starting: NSColor.darkGray, ending: NSColor.gray)
        gradient?.draw(in: dirtyRect, angle: 90.0)
    }
    
    override func mouseUp(with event: NSEvent) {
        // wait for a
        if (event.clickCount < DOUBLE_CLICK_COUNT) {
            return
        }
        
        // get the origin click point
        let newShape = Shape(origin: event.locationInWindow)
        
        print("Space.doubleClick \(newShape)")
    }

}
