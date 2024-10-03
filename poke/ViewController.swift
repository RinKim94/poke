//
//  ViewController.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//123123

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = MainViewController()
        let mainVC = UINavigationController(rootViewController: vc)
        
        setup(mainVC)
    }
    
    func setup(_ child: UIViewController) {
        addChild(child)
        
        self.view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0),
            child.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0),
            child.view.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 0),
            child.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0),
        ])
        child.didMove(toParent: self)
    }


}

