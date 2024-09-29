//
//  Pokemon.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    var imageURL: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    var id: Int {
        let components = url.split(separator: "/")
        return Int(components.last ?? "0") ?? 0
    }
}
