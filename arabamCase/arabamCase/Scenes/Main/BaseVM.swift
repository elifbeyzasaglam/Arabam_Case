//
//  BaseVM.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 29.07.2024.
//

import Foundation

protocol  BaseVMProtocol {
}

class BaseVM <R: Router>: BaseVMProtocol {
    var router: R
    init(router: R) {
    self.router = router
    }
}
