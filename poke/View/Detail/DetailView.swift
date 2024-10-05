//
//  DetailView.swift
//  poke
//
//  Created by KimRin on 10/5/24.
//

import UIKit

class DetailView: UIView {
    
    let nameLabel = UILabel()
    let imageView = UIImageView()
    let heightLabel = UILabel()
    let weightLabel = UILabel()
    let typesLabel = UILabel()
    let detailContainerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .mainRed
        
        detailContainerView.backgroundColor = .darkRed
        detailContainerView.layer.cornerRadius = 20
        detailContainerView.layer.masksToBounds = true
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        
        heightLabel.font = UIFont.systemFont(ofSize: 18)
        heightLabel.textColor = .white
        heightLabel.textAlignment = .center
        
        weightLabel.font = UIFont.systemFont(ofSize: 18)
        weightLabel.textColor = .white
        weightLabel.textAlignment = .center
        
        typesLabel.font = UIFont.systemFont(ofSize: 18)
        typesLabel.textColor = .white
        typesLabel.textAlignment = .center
        
        imageView.contentMode = .scaleAspectFit
        
        addSubview(detailContainerView)
        detailContainerView.addSubview(nameLabel)
        detailContainerView.addSubview(imageView)
        detailContainerView.addSubview(heightLabel)
        detailContainerView.addSubview(weightLabel)
        detailContainerView.addSubview(typesLabel)
        
        detailContainerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        typesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            detailContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: detailContainerView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            
            typesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typesLabel.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: typesLabel.bottomAnchor, constant: 10),
            heightLabel.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            weightLabel.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            weightLabel.bottomAnchor.constraint(equalTo: detailContainerView.bottomAnchor, constant: -20)
        ])
    }
}
