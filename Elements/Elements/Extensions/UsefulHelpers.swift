//
//  TimerExt.swift
//  Elements
//
//  Created by Kuba Sokolowski on 22/06/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import Foundation


/// Runs closure on the main thread after given delay in seconds
/// ```
/// runAfterDelay(seconds: 1.0) {
///     print("Hello")
/// }
/// ```
/// - Parameters:
///   - seconds: Number of seconds to delay
///   - closure: Given closure

func runAfterDelay(seconds: Double, closure: @escaping () -> Void) {
    let time = DispatchTime.now() + seconds
    DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
}
