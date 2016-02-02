//
//  Element.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/1/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

struct Element {
    let name: String
    let symbol: String
    
    init(dictionary: Dictionary<String,AnyObject>) {
        let kNameKey = "name"
        let kSymoblKey = "symbol"
        
        name = dictionary[kNameKey] as! String
        symbol = dictionary[kSymoblKey] as! String
    }
}