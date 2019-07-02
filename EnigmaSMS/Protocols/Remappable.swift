//
//  Remappable.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation

protocol Remappable {
    var nextMapper: Remappable? { get }
    
    func remap(_ x: Int) -> Int
    func shift()
    func shift(by: [Int])
    func reset()
}
