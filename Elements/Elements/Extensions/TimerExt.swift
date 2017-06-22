//
//  TimerExt.swift
//  Elements
//
//  Created by Kuba Sokolowski on 22/06/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import Foundation

extension Timer {
    static func runAfterDelay(seconds: Double, closure: @escaping () -> Void) {
        let time = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
    }
}
