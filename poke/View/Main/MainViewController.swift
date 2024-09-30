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
    }
    
    private func setup() {
        view = mainView
        navigationController?.isNavigationBarHidden = true
    }
    
    func bind() {}
}
