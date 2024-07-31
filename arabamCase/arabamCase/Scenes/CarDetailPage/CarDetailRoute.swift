//
//  CarDetailRoute.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 29.07.2024.
//

import UIKit

protocol CarDetailRoute {
    func navigateToDetail(from: UIViewController , with car: Car)
}

extension CarDetailRoute where Self: RouterProtocol {
    
    func navigateToDetail(from: UIViewController ,with car: Car) {
        let router = CarDetailRouter()
        let detailVM = CarDetailVM(router: router)
        detailVM.car = car
        let detailVC = CarDetailVC(viewModel: detailVM)
        route(from: from, to: detailVC, animated: true)
    }
}
