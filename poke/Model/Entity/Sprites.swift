//
//  Sprites.swift
//  poke
//
//  Created by KimRin on 10/5/24.
//

import Foundation

struct Sprites: Decodable {
    let frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
