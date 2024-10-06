//
//  PokemonCell.swift
//  poke
//
//  Created by KimRin on 9/30/24.
//

import RxSwift
import Kingfisher

import UIKit

final class PokemonCell: UICollectionViewCell, CellReusable {
    private let imageView = UIImageView()
    private let disposeBag = DisposeBag()
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }
    func setupUI() {
        
    }
    
    func configure(with pokemon: Pokemon) {
        if let url = URL(string: pokemon.imageURL) {
//            imageView.rx.loadImage(url: url)
//                .observe(on: MainScheduler.instance)
//                .bind(to: imageView.rx.image)
//                .disposed(by: disposeBag)
            imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
