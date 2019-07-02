//
//  Reflector.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//
import Foundation

class Reflector: Remappable {
    
    var nextMapper: Remappable?
    
    private var mappingsDict: [Int: Int] = [:]
    
    init(withMappings mappings: [Mapping<Int, Int>]) {
        self.createMappingsDict(mappings)
    }
    
    private func createMappingsDict(_ mappings: [Mapping<Int, Int>]) {
        mappings.forEach { (mapping) in
            self.mappingsDict[mapping.from] = mapping.to
            self.mappingsDict[mapping.to] = mapping.from
        }
    }
    
    func remap(_ x: Int) -> Int {
        return self.mappingsDict[x] ?? -1
    }
    
    func shift() {
        // NoOp - Reflector is static, it can't shift.
    }
    
    func shift(by: [Int]) {
        // NoOp
    }
    
    func reset() {
        // NoOp
}

}
