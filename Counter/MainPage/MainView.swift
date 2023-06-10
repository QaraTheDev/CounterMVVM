//
//  MainView.swift
//  Counter
//
//  Created by Andas on 08.06.2023.
//

import Foundation
import UIKit

class MainView: UIView {
    
    var viewModel: MainViewModel
    
    var counter: UILabel = {
       let counter = UILabel()
        counter.text = "Hey"
        counter.textColor = .black
        counter.font = .systemFont(ofSize: 32, weight: .medium)
        return counter
    }()
    
    var btn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .blue
        btn.titleLabel?.text = "Click me!"
        btn.frame = CGRect(x: 50, y: 50, width: 300, height: 100)
        return btn
    }()
            
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configure()
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        backgroundColor = .white
        addSubview(counter)
        addSubview(btn)
        counter.translatesAutoresizingMaskIntoConstraints = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            counter.centerXAnchor.constraint(equalTo: centerXAnchor),
            counter.centerYAnchor.constraint(equalTo: centerYAnchor),
            btn.centerYAnchor.constraint(equalTo: counter.centerYAnchor, constant: 20),
            btn.centerXAnchor.constraint(equalTo: counter.centerXAnchor)
        ])
        
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func bindViewModel() {
        
        viewModel.count.bind { [weak self] value in
            DispatchQueue.main.async {
                self?.counter.text = "Count: \(value)"
            }
        }
    }
    
    @objc func buttonTapped() {
        viewModel.increaseCount()
    }
}
