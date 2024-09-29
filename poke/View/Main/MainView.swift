//
//  MainView.swift
//  poke
//
//  Created by KimRin on 9/30/24.
//


import UIKit

class MainView: UIView {
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let width = (UIScreen.main.bounds.width - 40) / 3
        layout.itemSize = CGSize(width: width, height: width)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .darkRed
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseIdentifier)
        return collectionView
    }()
    
    private let pokemonBallImageView = {
        let imageView = UIImageView(image: UIImage(named: "pokemonBall"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .mainRed
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        [
            collectionView,
            pokemonBallImageView
        ].forEach { self.addSubview($0) }
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pokemonBallImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonBallImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            pokemonBallImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonBallImageView.widthAnchor.constraint(equalToConstant: 100),
            pokemonBallImageView.heightAnchor.constraint(equalToConstant: 100),
            
            collectionView.topAnchor.constraint(equalTo: pokemonBallImageView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    

}

