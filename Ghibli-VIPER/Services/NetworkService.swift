//
//  NetworkService.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

protocol Service {
    func request(completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class NetworkService: Service {
    private let urlString = "https://ghibliapi.herokuapp.com/films"
    
    func request(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = createTask(url: url, completion: completion)
        task.resume()
    }
    
    private func createTask(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async { completion(data, response, error) }
        }
    }
}
