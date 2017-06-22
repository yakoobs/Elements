//
//  TimerExt.swift
//  Elements
//
//  Created by Kuba Sokolowski on 22/06/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import Foundation

extension Timer {
    static func doWithDelay(seconds: Double, after: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: after)
    }
}
