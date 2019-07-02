//
//  SpindleFactory.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
protocol SpindleFactory {
    var charMappings: [Mapping<Int, Character>] { get }
    func createSpindle(withConfig config: SpindleConfiguration) -> Remappable
}
