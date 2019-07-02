//
//  Plugboard.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//
import Foundation

class Plugboard: Remappable {
    
    var nextMapper: Remappable?
    
    private var mappingsDict: [Int: Int] = [:]
    
    init(_ mappings: [Mapping<Int, Int>], nextMapper: Remappable) {
        self.nextMapper = nextMapper
        self.createMappingsDict(mappings)
    }
    
    private func createMappingsDict(_ mappings: [Mapping<Int, Int>]) {
        mappings.forEach { (mapping) in
            self.mappingsDict[mapping.from] = mapping.to
            self.mappingsDict[mapping.to] = mapping.from
        }
    }
    
    func remap(_ x: Int) -> Int {
        let destination = self.mappingsDict[x] ?? x
        if let nextMapperResult = self.nextMapper?.remap(destination) {
            self.nextMapper?.shift()
            return self.mappingsDict[nextMapperResult] ?? nextMapperResult
        } else {
            return -1
        }
    }
    
    func shift() {
        // NoOp - Plugboard can't shift, and shouldn't forward calls to rotors.
    }
    
    func shift(by: [Int]) {
        self.nextMapper?.shift(by: by)
    }
    
    func reset() {
        self.nextMapper?.reset()
    }
}

