//
//  String+Extension.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 25.07.2024.
//

import UIKit

public extension String {
    func hdSizeImagePath() -> String {
        return self.replacingOccurrences(of: "{0}", with: "800x600")
    }
}



