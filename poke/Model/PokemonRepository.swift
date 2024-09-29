//
//  PokemonRepository.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//

import Foundation
import RxSwift


/* 이점
 //참조할것이 아니고 메서드만 쓸거라서 구조체로 선언
 //뷰모델에 만들지 않고 여기서 한번 더 감싸게 쓰면 가독성이 좋아지지않을까
 
SRP/ 데이터와 관련 네트워크 작업만 담당, 타 비즈니스로직과 분리
재사용성 용이, 테스트 용이, 에러 처리 용이, 가독성 향상, 미래 확장성 고려시 수정 용이

 */



struct PokemonRepository {
    private let networkManager = NetworkManager.shared
    
    //포켓몬의 리스트를 가져오는 메서드
    func fetchPokemonList(limit: Int, offset: Int) -> Single<PokemonList> {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)"
        
        guard let url = URL(string: urlString) else {
            return Single.error(NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        }
        
        return networkManager.fetch(url: url)
    }
    
    //포켓몬 디테일 정보 가져오는 메서드
    func fetchPokemonDetail(pokemonId: Int) -> Single<PokemonDetail> {
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/"
        
        guard let url = URL(string: urlString) else {
            return Single.error(NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        }
        
        return networkManager.fetch(url: url)
    }
    
    
}
