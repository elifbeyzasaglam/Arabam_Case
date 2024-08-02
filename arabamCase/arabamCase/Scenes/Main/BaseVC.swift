//
//  BaseVC.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 30.07.2024.
//


import UIKit

class BaseVC<T: BaseVMProtocol>: UIViewController {
    
    // MARK: - Properties
    var viewModel: T
   
    required init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

