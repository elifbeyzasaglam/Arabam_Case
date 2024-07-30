//
//  MainVM.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 24.07.2024.
//

import UIKit

final class MainVM: BaseVM<MainRouter> {
    var cars: [Car] = []
    var onCarsFetched: (() -> Void)?
    
    
    func fetchData() {
        ServiceManager.shared.fetchCar { [weak self] response in
            DispatchQueue.main.async {
                switch response {
                case .success(let cars):
                    self?.cars = cars
                    self?.onCarsFetched?()
                case .failure(let error):
                    print("Veriler gelmiyor \(error)")
                }
            }
        }
    }
    
    func didSelectCar(from: UIViewController , car: Car) {
        router.navigateToDetail(from: from, with: car)
      }
}

