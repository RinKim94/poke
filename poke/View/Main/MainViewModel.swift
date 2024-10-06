//
//  MainViewModel.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    private let repository = PokemonRepository()
    private var currentOffset = 0
    private let limit = 20
    private let pokemonListRelay = BehaviorRelay<[Pokemon]>(value: [])
    private let disposeBag = DisposeBag()
    init() {}
    
    func transform(_ input: Input) -> Output {
        let initialLoad = input.load
        // 튜플로 만들어주고
            .withUnretained(self)
        //self 를 owner 라는 이름으로 맨 마지막 이벤트만 받겠다?
            .flatMapLatest { owner, _ in
                owner.repository.fetchPokemonList(limit: owner.limit, offset: 0)
                
            }
            .do(onNext: { [weak self] response in
                guard let self = self else { return }
                self.currentOffset = self.limit
                self.pokemonListRelay.accept(response.results)
            })
        let loadMore = input.loadMore
            .withUnretained(self)
            .filter { owner, _ in
                owner.currentOffset > 0
            }
            .flatMapLatest { owner, _ in
                owner.repository.fetchPokemonList(limit: owner.limit, offset: owner.currentOffset)
                
            }
            .do(onNext: { [weak self]  response in
                guard let self = self else { return }
                self.currentOffset += self.limit
                self.pokemonListRelay.accept(self.pokemonListRelay.value + response.results)
            })
                
        Observable.merge(initialLoad, loadMore)
            .subscribe()
            .disposed(by: disposeBag)
        
        return .init(pokemonList: pokemonListRelay.asObservable())
    }
    
}

extension MainViewModel {
    
    struct Input {
        let load: Observable<Void>
        let loadMore: Observable<Void>
    }
    
    struct Output {
        let pokemonList: Observable<[Pokemon]>
    }
    
}
// observer relay subject 의차이점

