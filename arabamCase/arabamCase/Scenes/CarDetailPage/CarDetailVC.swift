//
//  DetailVCViewController.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 25.07.2024.
//

import UIKit

class CarDetailVC: BaseVC<CarDetailVM> {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var PriceLabell: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

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



