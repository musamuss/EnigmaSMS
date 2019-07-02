//
//  Enigma.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
protocol Enigma {
    func encode(_ message: String) -> String
    func decode(_ message: String) -> String
}
