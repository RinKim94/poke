//
//  MainViewModel.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//

import Foundation
import RxSwift

class MainViewModel {
    private let repository = PokemonRepository()
    
    init() {}
    
    func transform(_ input: Input) -> Output {
        let pokemonList = input.load
        // 튜플로 만들어주고
            .withUnretained(self)
        //self 를 owner 라는 이름으로 맨 마지막 이벤트만 받겠다?
            .flatMapLatest { owner, _ in
                owner.repository.fetchPokemonList(limit: 20, offset: 0)
                
            }.map { $0.results }
            .asObservable()
        
        return .init(pokemonList: pokemonList)
    }
    
}

extension MainViewModel {
    
    struct Input {
        let load: Observable<Void>
    }
    
    struct Output {
        let pokemonList: Observable<[Pokemon]>
    }
    
}

