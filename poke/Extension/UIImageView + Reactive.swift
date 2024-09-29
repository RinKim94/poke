//
//  UIImageView + Reactive.swift
//  poke
//
//  Created by KimRin on 9/30/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIImageView {
    func loadImage(url: URL) -> Observable<UIImage?> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    observer.onError(error)
                } else if let data = data,
                          let image = UIImage(data: data) {
                    observer.onNext(image)
                    observer.onCompleted()
                } else {
                    observer.onNext(nil)
                    observer.onCompleted()
                }
                
                
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
