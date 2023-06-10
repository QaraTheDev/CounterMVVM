//
//  MainViewModel.swift
//  Counter
//
//  Created by Andas on 10.06.2023.
//

import Foundation

class MainViewModel {
    
    var count = Bindable<Int>(value: 0)
    
    func increaseCount() {
        count.value += 1
    }
    
}
