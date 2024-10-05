//
//  PokemonDetail.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//

import Foundation

class PokemonDetail: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
    let sprites: Sprites
}
