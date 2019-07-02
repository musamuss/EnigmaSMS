//
//  EnigmaMachine.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
class EnigmaMachine: Enigma {
    
    private let spindle: Remappable
    private let config: SpindleConfiguration
    private var charMappings: [Mapping<Int, Character>]
    private var indexDict: [Int: Character] = [:]
    private var charDict: [Character: Int] = [:]
    
    init(_ config: SpindleConfiguration, _ factory: SpindleFactory = SmallAlphabetSpindleFactory()) {
        self.config = config
        self.spindle = factory.createSpindle(withConfig: config)
        self.charMappings = factory.charMappings
        
        self.createAlphabetCache()
    }
    
    private func createAlphabetCache() {
        self.charMappings.forEach { (item) in
            self.indexDict[item.from] = item.to
            self.charDict[item.to] = item.from
        }
    }
    
    func encode(_ message: String) -> String {
        
        self.setRotors(config.rotorSettings.reversed())
        
        let randomKey = self.generateRandomKey()
        
        let encodedKey: String = randomKey
            .compactMap { self.indexDict[$0] }
            .reduce("") { $0 + self.remap(String($1)) }
        
        self.setRotors(randomKey)
        
        return encodedKey + self.remap(message)
    }
    
    private func generateRandomKey() -> [Int] {
        var key: [Int] = []
        for _ in 0..<self.config.rotors.count {
            let randomNumber = Int(arc4random_uniform(UInt32(self.charMappings.count)))
            key.append(randomNumber)
        }
        return key
    }
    
    func decode(_ message: String) -> String {
        
        self.setRotors(config.rotorSettings.reversed())
        
        let key = getRandomKey(message)
        
        self.setRotors(key)
        
        let originalMessage = self.removeRandomKey(message)
        
        return self.remap(originalMessage)
    }
    
    private func remap(_ string: String) -> String {
        var remappedString = ""
        
        string.uppercased().forEach { (char) in
            if let charIndex = self.charDict[char] {
                let remappedIndex = self.spindle.remap(charIndex)
                if let remappedChar = self.indexDict[remappedIndex] {
                    remappedString.append(remappedChar)
                }
            }
        }
        
        return remappedString
    }
    
    private func getRandomKey(_ message: String) -> [Int] {
        guard message.count >= self.config.rotors.count else {
            return []
        }
        
        var key: [Int] = []
        var encodedMessage = message
        
        for _ in 0..<self.config.rotors.count {
            let char = encodedMessage.removeFirst()
            if let charIndex = self.charDict[char] {
                let decodedIndex = self.spindle.remap(charIndex)
                key.append(decodedIndex)
            }
        }
        
        return key
    }
    
    private func removeRandomKey(_ message: String) -> String {
        guard message.count >= self.config.rotors.count else {
            return message
        }
        
        var originalMessage = message
        originalMessage.removeFirst(self.config.rotors.count)
        
        return originalMessage
    }
    
    private func setRotors(_ setting: [Int]) {
        self.spindle.reset()
        self.spindle.shift(by: setting)
    }
}
