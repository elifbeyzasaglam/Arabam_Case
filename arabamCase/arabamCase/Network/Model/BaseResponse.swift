//
//  BaseResponse.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 23.07.2024.
//

import Foundation

struct Car: Decodable {
    let id: Int
    let title: String
    let location: Location
    let category: Category
    let modelName: String
    let price: Int
    let priceFormatted: String
    let date: String
    let dateFormatted: String
    let photo: String
    let properties: [Property]
}

struct Location: Decodable {
    let cityName: String
    let townName: String
}

struct Category: Decodable {
    let id: Int
    let name: String
}

struct Property: Decodable {
    let name: String
    let value: String
}
