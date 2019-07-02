//
//  SmallAlphabetSpindleFactory.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation

// 28 Mappings - English alphabet + '.' and ' '
class SmallAlphabetSpindleFactory: SpindleFactory {
    
    private let reflectorMappings = [
        Mapping(from: 0, to: 11), Mapping(from: 1, to: 19), Mapping(from: 2, to: 6), Mapping(from: 3, to: 23), Mapping(from: 4, to: 10), Mapping(from: 5, to: 16), Mapping(from: 7, to: 25), Mapping(from: 8, to: 12), Mapping(from: 9, to: 20), Mapping(from: 13, to: 15),
        Mapping(from: 14, to: 22), Mapping(from: 17, to: 24), Mapping(from: 18, to: 26), Mapping(from: 21, to: 27)
    ]
    
    let charMappings: [Mapping<Int, Character>] = [
        Mapping(from: 0, to: "A"), Mapping(from: 1, to: "B"), Mapping(from: 2, to: "C"), Mapping(from: 3, to: "D"), Mapping(from: 4, to: "E"), Mapping(from: 5, to: "F"), Mapping(from: 6, to: "G"), Mapping(from: 7, to: "H"), Mapping(from: 8, to: "I"), Mapping(from: 9, to: "J"),
        Mapping(from: 10, to: "K"), Mapping(from: 11, to: "L"), Mapping(from: 12, to: "M"), Mapping(from: 13, to: "N"), Mapping(from: 14, to: "O"), Mapping(from: 15, to: "P"), Mapping(from: 16, to: "Q"), Mapping(from: 17, to: "R"), Mapping(from: 18, to: "S"), Mapping(from: 19, to: "T"),
        Mapping(from: 20, to: "U"), Mapping(from: 21, to: "V"), Mapping(from: 22, to: "W"), Mapping(from: 23, to: "X"), Mapping(from: 24, to: "Y"), Mapping(from: 25, to: "Z"), Mapping(from: 26, to: " "), Mapping(from: 27, to: ".")
    ]
    
    func createSpindle(withConfig config: SpindleConfiguration) -> Remappable {
        
        let reflector = Reflector(withMappings: reflectorMappings)
        let rotors: Remappable = config.rotors.compactMap({ RotorNumber(rawValue: $0) }).reduce(reflector) { Rotor($1.mappings, nextMapper: $0) }
        let plugBoard = Plugboard(config.plugboardMappings, nextMapper: rotors)
        plugBoard.shift(by: config.rotorSettings.reversed())
        
        return plugBoard
    }
}

fileprivate enum RotorNumber: Int {
    
    case I = 1
    case II = 2
    case III = 3
    case IV = 4
    case V = 5
    case VI = 6
    
    var mappings: [Mapping<Int, Int>] {
        switch self {
        case .I: return [
            Mapping(from: 0, to: 14), Mapping(from: 1, to: 23), Mapping(from: 2, to: 3), Mapping(from: 3, to: 20), Mapping(from: 4, to: 9), Mapping(from: 5, to: 13), Mapping(from: 6, to: 4), Mapping(from: 7, to: 19), Mapping(from: 8, to: 1), Mapping(from: 9, to: 16),
            Mapping(from: 10, to: 8), Mapping(from: 11, to: 21), Mapping(from: 12, to: 0), Mapping(from: 13, to: 24), Mapping(from: 14, to: 15), Mapping(from: 15, to: 2), Mapping(from: 16, to: 27), Mapping(from: 17, to: 6), Mapping(from: 18, to: 12), Mapping(from: 19, to: 10),
            Mapping(from: 20, to: 26), Mapping(from: 21, to: 5), Mapping(from: 22, to: 17), Mapping(from: 23, to: 22), Mapping(from: 24, to: 7), Mapping(from: 25, to: 25), Mapping(from: 26, to: 18), Mapping(from: 27, to: 11)
            ]
        case .II: return [
            Mapping(from: 0, to: 16), Mapping(from: 1, to: 17), Mapping(from: 2, to: 4), Mapping(from: 3, to: 23), Mapping(from: 4, to: 10), Mapping(from: 5, to: 22), Mapping(from: 6, to: 13), Mapping(from: 7, to: 8), Mapping(from: 8, to: 5), Mapping(from: 9, to: 25),
            Mapping(from: 10, to: 18), Mapping(from: 11, to: 1), Mapping(from: 12, to: 20), Mapping(from: 13, to: 3), Mapping(from: 14, to: 11), Mapping(from: 15, to: 7), Mapping(from: 16, to: 0), Mapping(from: 17, to: 27), Mapping(from: 18, to: 24), Mapping(from: 19, to: 21),
            Mapping(from: 20, to: 2), Mapping(from: 21, to: 26), Mapping(from: 22, to: 14), Mapping(from: 23, to: 12), Mapping(from: 24, to: 6), Mapping(from: 25, to: 19), Mapping(from: 26, to: 15), Mapping(from: 27, to: 9)
            ]
        case .III: return [
            Mapping(from: 0, to: 3), Mapping(from: 1, to: 20), Mapping(from: 2, to: 14), Mapping(from: 3, to: 12), Mapping(from: 4, to: 16), Mapping(from: 5, to: 23), Mapping(from: 6, to: 19), Mapping(from: 7, to: 26), Mapping(from: 8, to: 2), Mapping(from: 9, to: 27),
            Mapping(from: 10, to: 17), Mapping(from: 11, to: 22), Mapping(from: 12, to: 25), Mapping(from: 13, to: 4), Mapping(from: 14, to: 11), Mapping(from: 15, to: 6), Mapping(from: 16, to: 21), Mapping(from: 17, to: 1), Mapping(from: 18, to: 9), Mapping(from: 19, to: 18),
            Mapping(from: 20, to: 13), Mapping(from: 21, to: 10), Mapping(from: 22, to: 5), Mapping(from: 23, to: 24), Mapping(from: 24, to: 7), Mapping(from: 25, to: 15), Mapping(from: 26, to: 0), Mapping(from: 27, to: 8)
            ]
        case .IV: return [
            Mapping(from: 0, to: 21), Mapping(from: 1, to: 14), Mapping(from: 2, to: 26), Mapping(from: 3, to: 23), Mapping(from: 4, to: 27), Mapping(from: 5, to: 1), Mapping(from: 6, to: 18), Mapping(from: 7, to: 25), Mapping(from: 8, to: 22), Mapping(from: 9, to: 10),
            Mapping(from: 10, to: 24), Mapping(from: 11, to: 0), Mapping(from: 12, to: 15), Mapping(from: 13, to: 7), Mapping(from: 14, to: 20), Mapping(from: 15, to: 4), Mapping(from: 16, to: 19), Mapping(from: 17, to: 13), Mapping(from: 18, to: 2), Mapping(from: 19, to: 8),
            Mapping(from: 20, to: 6), Mapping(from: 21, to: 12), Mapping(from: 22, to: 16), Mapping(from: 23, to: 9), Mapping(from: 24, to: 3), Mapping(from: 25, to: 11), Mapping(from: 26, to: 17), Mapping(from: 27, to: 5)
            ]
        case .V: return [
            Mapping(from: 0, to: 1), Mapping(from: 1, to: 15), Mapping(from: 2, to: 9), Mapping(from: 3, to: 20), Mapping(from: 4, to: 10), Mapping(from: 5, to: 14), Mapping(from: 6, to: 0), Mapping(from: 7, to: 19), Mapping(from: 8, to: 6), Mapping(from: 9, to: 23),
            Mapping(from: 10, to: 4), Mapping(from: 11, to: 26), Mapping(from: 12, to: 16), Mapping(from: 13, to: 2), Mapping(from: 14, to: 11), Mapping(from: 15, to: 7), Mapping(from: 16, to: 22), Mapping(from: 17, to: 27), Mapping(from: 18, to: 21), Mapping(from: 19, to: 3),
            Mapping(from: 20, to: 17), Mapping(from: 21, to: 8), Mapping(from: 22, to: 25), Mapping(from: 23, to: 5), Mapping(from: 24, to: 18), Mapping(from: 25, to: 12), Mapping(from: 26, to: 24), Mapping(from: 27, to: 13)
            ]
        case .VI: return [
            Mapping(from: 0, to: 16), Mapping(from: 1, to: 12), Mapping(from: 2, to: 21), Mapping(from: 3, to: 25), Mapping(from: 4, to: 15), Mapping(from: 5, to: 22), Mapping(from: 6, to: 27), Mapping(from: 7, to: 13), Mapping(from: 8, to: 26), Mapping(from: 9, to: 4),
            Mapping(from: 10, to: 9), Mapping(from: 11, to: 24), Mapping(from: 12, to: 1), Mapping(from: 13, to: 18), Mapping(from: 14, to: 23), Mapping(from: 15, to: 19), Mapping(from: 16, to: 10), Mapping(from: 17, to: 2), Mapping(from: 18, to: 20), Mapping(from: 19, to: 7),
            Mapping(from: 20, to: 5), Mapping(from: 21, to: 11), Mapping(from: 22, to: 3), Mapping(from: 23, to: 14), Mapping(from: 24, to: 17), Mapping(from: 25, to: 6), Mapping(from: 26, to: 8), Mapping(from: 27, to: 0)
            ]
        }
    }
}
