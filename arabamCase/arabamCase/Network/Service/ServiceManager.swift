//
//  ServiceManager.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 23.07.2024.
//

import Foundation

final class ServiceManager {
    static let shared = ServiceManager()
    private let baseURL = "https://sandbox.arabamd.com/api/v1"
       
       private func createURL(path: String, parameters: [String: String]) -> URL? {
           var urlString = baseURL + path
           
           if !parameters.isEmpty {
               urlString += "?"
               parameters.forEach { key, value in
                   urlString += "\(key)=\(value)&"
               }
               urlString.removeLast()
           }
           return URL(string: urlString)
       }
// MARK: fetchCar
    func fetchCar(sort: Int, sortDirection: Int, take: Int, completion: @escaping (Result<[Car], Error>) -> Void) {
        let parameters = [
            "sort": "\(sort)",
            "sortDirection": "\(sortDirection)",
            "take": "\(take)"
        ]
        guard let url = createURL(path: "/listing", parameters: parameters) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Car].self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
