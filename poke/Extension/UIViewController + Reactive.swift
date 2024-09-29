//
//  UIViewController + Reactive.swift
//  poke
//
//  Created by KimRin on 9/29/24.
//
import RxSwift
import RxCocoa

import Foundation
import UIKit


extension Reactive where Base: UIViewController {
    var viewWillAppear: Observable<Void> {
        return methodInvoked(#selector(Base.viewWillAppear(_:)))
            .map { _ in}
    }
}
