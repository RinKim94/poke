//
//  ReusableCell.swift
//  poke
//
//  Created by KimRin on 9/30/24.
//

import Foundation

protocol CellReusable {
    static var reuseIdentifier: String { get }
}

extension CellReusable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
