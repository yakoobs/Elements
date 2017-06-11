//
//  ArrayExt.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

extension Array {
    /**
     Randomly rearranges the elements of self using the Fisher-Yates shuffle
     */
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
 
    /**
     Shuffles the values of the array into a new one
     
     :returns: Shuffled copy of self
     */
    func shuffled () -> Array {
        var shuffled = self
        
        shuffled.shuffle()
        
        return shuffled
    }
}
