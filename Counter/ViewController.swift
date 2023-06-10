//
//  ViewController.swift
//  Counter
//
//  Created by Andas on 08.06.2023.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = MainViewModel()
        let mainView = MainView(viewModel: viewModel)
        view = mainView
    }


}

