//
//  ElementsLoader.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/1/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import UIKit

class ElementsManager {

    var elements: [Element]
    
    init() {
        elements = [Element]()
        loadElements()
    }
    
    private func loadElements() {
        let kPlistFileName = "Elements"
        let kPlistFileType = "plist"
        if let path = NSBundle.mainBundle().pathForResource(kPlistFileName, ofType: kPlistFileType),
            array = NSArray(contentsOfFile: path) as? [Dictionary<String,AnyObject>] {
                
            elements = array.map( { Element(dictionary: $0) } )
        }
    }
    
    
    
}
