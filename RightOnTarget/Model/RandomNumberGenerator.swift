//
//  RandomNumberGenerator.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 07.04.2022.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue()
}

class RandomNumberGenerator: GeneratorProtocol {
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretNumber: Int!
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else { return nil }
        
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    func getRandomValue() {
        currentSecretNumber = (minSecretValue...maxSecretValue).randomElement()!
    }
}

