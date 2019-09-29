//
//  ViewController.swift
//  Nip
//
//  Created by Public on 9/28/19.
//  Copyright © 2019 Public. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
        
    @IBOutlet var shapeArray: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.wantsLayer = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

