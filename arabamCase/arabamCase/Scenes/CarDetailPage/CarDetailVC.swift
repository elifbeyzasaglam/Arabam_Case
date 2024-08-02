//
//  DetailVCViewController.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 25.07.2024.
//

import UIKit

final class CarDetailVC: BaseVC<CarDetailVM> {
    // MARK: - Outlets
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var modelNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var PriceLabell: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
// MARK: BindViewModel
        func bindViewModel() {
        guard let car = viewModel.car else { return }
        titleLabel.text = car.title
        categoryLabel.text = car.category.name
        locationLabel.text = "\(car.location.cityName), \(car.location.townName)"
        modelNameLabel.text = car.modelName
        PriceLabell.text = car.priceFormatted
        dateLabel.text = car.dateFormatted
        
        if let url = URL(string: car.photo.hdSizeImagePath()) {
            detailImageView.kf.setImage(with: url)
        }
    }
}



