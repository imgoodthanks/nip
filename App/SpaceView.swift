//
//  SpaceView.swift
//  Nip
//
//  Created by Public on 9/28/19.
//  Copyright © 2019 Public. All rights reserved.
//

import Cocoa

let DOUBLE_CLICK_COUNT = 2
let DEBUG_DRAW_FADE_TIME = 1.0

class SpaceView: NSView {
    
    var shapes: [Shape] = []
    var cachePath: NSBezierPath = NSBezierPath()
    var debugDraw = false
    
    override func draw(_ dirtyRect: NSRect) {
        print("SpaceView.draw")
        
        // draw the background
        let gradient = NSGradient.init(starting: NSColor.darkGray, ending: NSColor.gray)
        gradient?.draw(in: dirtyRect, angle: 90.0)
        
        // draw a debug outline
        // ...then fade it out
        if self.debugDraw {
            NSColor.blue.set()
            cachePath.fill()
            self.debugDraw = false
            
            let timer = Timer.scheduledTimer(withTimeInterval: DEBUG_DRAW_FADE_TIME, repeats: false) {
                timer in self.needsDisplay = true
            }
            
            return
        }
        
        // clear the cached path.
        cachePath.removeAllPoints()
        
        // draw individual shapes
        let protoShape = NSMakeRect(0, 0, 100, 100)
            
        // draw each shape
        for shape in shapes {
            // centered on the creation shape.origin
            let shapeRect = NSMakeRect(
                shape.origin.x - (protoShape.width / 2),
                shape.origin.y - (protoShape.height / 2),
                protoShape.height,
                protoShape.width
            )
            let shapePath = NSBezierPath.init(rect: shapeRect)
            NSColor.white.set()
            shapePath.fill()
            
            // cache the path for hit testing
            self.cachePath.append(shapePath)
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        if cachePath.contains(event.locationInWindow) {
            print("SpaceView.mouseUp cachePath has event.locationInWindow")
            
            self.debugDraw = true
            self.needsDisplay = true
            
            return
        }
        
        // wait for a doubleClick or a selected click
        if (event.clickCount < DOUBLE_CLICK_COUNT) {
            return
        }

        // get the origin click point
        let newShape = Shape(origin: event.locationInWindow)

        self.shapes.append(newShape)
        self.needsDisplay = true
        
        print("SpaceView.doubleClick \(newShape)")
    }
    
    func mouseUpDoubleClick(event: NSEvent) {
        
    }
}
