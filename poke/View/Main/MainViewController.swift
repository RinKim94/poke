//
//  MainViewController.swift
//  poke
//
//  Created by KimRin on 9/30/24.
//

import Foundation
import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    private let viewModel = MainViewModel()
    
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }
    
    private func setup() {
        view = mainView
        navigationController?.isNavigationBarHidden = true
    }
    
    func bind() {
        
        let load = self.rx.viewWillAppear
        
        let input = MainViewModel.Input(load: load)
        
        let output = viewModel.transform(input)
        
        output.pokemonList
            .bind(to: mainView.collectionView.rx.items(cellIdentifier: "PokemonCell", cellType: PokemonCell.self)) { index, pokemon, cell in
                cell.configure(with: pokemon)
                
            }
            .disposed(by: disposeBag)
        
            
        mainView.collectionView.rx.modelSelected(Pokemon.self)
            .withUnretained(self)
            .subscribe(onNext: { owner, pokemon in
                print(pokemon.id)
            })
            .disposed(by: disposeBag)
    }
    
    
    
}
