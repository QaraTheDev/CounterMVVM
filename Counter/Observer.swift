//
//  Observer.swift
//  Counter
//
//  Created by Andas on 10.06.2023.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: Listener?
    
    init(value: T, listener: Listener? = nil) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
