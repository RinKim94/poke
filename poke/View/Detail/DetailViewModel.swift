//
//  DetailViewModel.swift
//  poke
//
//  Created by KimRin on 10/5/24.
//

import Foundation
import RxSwift

class DetailViewModel {
    private let respository = PokemonRepository()
    private let disposeBag = DisposeBag()
    private let pokemonId: Int
    
    init(pokemonId: Int) {
        self.pokemonId = pokemonId
    }
    
    func transform(_ input: Input) -> OutPut {
        let pokemonDetail = input.load
            .withUnretained(self)
            .flatMapLatest { owner, _ in
                owner.respository
                    .fetchPokemonDetail(pokemonId: owner.pokemonId)
            }
            .asObservable()
        return .init(pokemonDetail: pokemonDetail)
    }
    
    

}

extension DetailViewModel {
    struct Input {
        let load: Observable<Void>
    }
    struct OutPut {
        let pokemonDetail: Observable<PokemonDetail>
    }
}
