//
//  ServiceManager.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 23.07.2024.
//

import Foundation

final class ServiceManager {
    static let shared = ServiceManager()
    
    func fetchCar(completion: @escaping (Result<[Car], Error>) -> Void) {
        let baseUrl = "https://sandbox.arabamd.com/api/v1/listing?sort=1&sortDirection=0&take=10"
        
        guard let url = URL(string: baseUrl) else { return }
        
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
