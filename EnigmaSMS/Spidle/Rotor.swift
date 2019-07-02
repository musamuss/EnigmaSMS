//
//  Rotor.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
class Rotor: Remappable {
    
    var nextMapper: Remappable?
    
    private var shifts: Int = 0
    private var mappings: [Mapping<Int, Int>]
    
    init(_ mappings: [Mapping<Int, Int>], nextMapper: Remappable) {
        self.mappings = mappings
        self.nextMapper = nextMapper
    }
    
    func remap(_ x: Int) -> Int {
        let destination = self.destinationFor(x)
        if let nextMapperResult = self.nextMapper?.remap(destination) {
            return self.sourceFor(nextMapperResult)
        } else {
            return -1
        }
    }
    
    private func destinationFor(_ x: Int) -> Int {
        if let mapping = self.mappings.first(where: { $0.from == x }) {
            return mapping.to
        } else {
            return -1
        }
    }
    
    private func sourceFor(_ x: Int) -> Int {
        if let mapping = self.mappings.first(where: { $0.to == x }) {
            return mapping.from
        } else {
            return -1
        }
    }
    
    func shift() {
        self.shiftMappings(by: 1)
        
        self.shifts += 1
        if self.shifts >= self.mappings.count {
            self.shifts = 0
            self.nextMapper?.shift()
        }
    }
    
    func shift(by: [Int]) {
        guard by.count > 0 else {
            return
        }
        
        var shiftArray = by;
        let value = shiftArray.removeFirst()
        
        self.shiftMappings(by: value)
        self.shifts = value
        self.nextMapper?.shift(by: shiftArray)
    }
    
    func reset() {
        if self.shifts > 0 {
            self.shift(by: [(self.mappings.count - self.shifts)])
        }
        self.nextMapper?.reset()
    }
    
    private func shiftMappings(by: Int) {
        let shiftedMappings = self.mappings.map { Mapping(from: nextIndex($0.from, offset: by), to: nextIndex($0.to, offset: by)) }
        self.mappings = shiftedMappings
    }
    
    private func nextIndex(_ x: Int, offset: Int) -> Int {
        return (x + offset) % self.mappings.count
    }
}
