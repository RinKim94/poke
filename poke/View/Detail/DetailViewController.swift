//
//  DetailViewController.swift
//  poke
//
//  Created by KimRin on 10/5/24.
//

import Foundation
import RxSwift
import UIKit

class DetailViewController: UIViewController {
    private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    private let detailView = DetailView()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        setup()
        bind()
    }
    
    
    private func setup() {
        navigationController?.isNavigationBarHidden = false
        view = detailView
    }
    private func bind() {
        let load = self.rx.viewWillAppear
        let input = DetailViewModel.Input(load: load)
        let output = viewModel.transform(input)
        
        let detail = output.pokemonDetail.share()
        
        detail
            .map {
                "No.\($0.id) \(PokemonTranslator.getKoreanName(for: $0.name))"
            }
            .bind(to: detailView.nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        detail
            .map { $0.types}
            .map {
                $0.map {
                    PokemonTypeName(rawValue: $0.type.name)?.displayName ?? "" } }
            .map { $0.joined(separator: ", ") }
            .map { "타입: \($0)" }
            .bind(to: detailView.typesLabel.rx.text)
            .disposed(by: disposeBag)
        
        detail
            .map { Double($0.height) / 10.0 }
            .map {"키: \($0)m"}
            .bind(to: detailView.heightLabel.rx.text)
            .disposed(by: disposeBag)
        
        detail
            .map { Double($0.weight) }
            .map {"몸무게: \($0)kg"}
            .bind(to: detailView.weightLabel.rx.text)
            .disposed(by: disposeBag)
    
        detail
            .map { $0.sprites.frontDefault }
            .compactMap { URL(string: $0) } //nil 일경우 걸러짐
            .withUnretained(self)
            .flatMapLatest { owner, url in
                owner.detailView.imageView.rx.loadImage(url: url)
            }
            .observe(on: MainScheduler.instance)
            .bind(to: detailView.imageView.rx.image)
            .disposed(by: disposeBag)
    }
    
}
