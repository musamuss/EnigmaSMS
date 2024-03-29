//
//  ViewControllerDecoder.swift
//  EnigmaSMS
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit

class ViewControllerDecoder: UIViewController {

    @IBOutlet weak var fieldDecode1: UITextField!
    @IBOutlet weak var fieldDecode2: UILabel!
    @IBAction func buttonDecode(_ sender: Any) {
        ButtonClickedDecode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func ButtonClickedDecode()  {
        let config = SpindleConfiguration(plugboardMappings: [Mapping(from: 23, to: 8), Mapping(from: 1, to: 10), Mapping(from: 15, to: 16), Mapping(from: 3, to: 13), Mapping(from: 5, to: 20), Mapping(from: 0, to: 21)],
                                          rotors: [2, 1, 5],
                                          rotorSettings: [11, 5, 19])
        
       // let encodingEnigma = EnigmaMachine(config)
        let decodingEnigma = EnigmaMachine(config)
        
        //let encodedString = encodingEnigma.encode(fieldOne.text ?? "hello")
        //fieldTwo.text = encodedString
        //print("Encoded string: ", encodedString)
        let decodedString = decodingEnigma.decode(fieldDecode1.text ?? "hello")
        fieldDecode2.text = decodedString
        
    }
}
