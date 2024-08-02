//
//  CarCellTableViewCell.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 24.07.2024.
//

import UIKit
import Kingfisher

final class CarCell: UITableViewCell {
   
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var carImageView: UIImageView!
    
    // MARK: configure
    func configure(with car: Car) {
        titleLabel.text = car.title
        priceLabel.text = car.priceFormatted
        dataLabel.text = car.dateFormatted
       
        if let url = URL(string: car.photo.hdSizeImagePath()) {
            carImageView.kf.setImage(with: url)
       }
    }
}



    

