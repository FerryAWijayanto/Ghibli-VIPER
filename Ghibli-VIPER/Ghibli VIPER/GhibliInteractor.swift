//
//  GhibliInteractor.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

protocol GhibliInteractorProtocol: AnyObject {
    func getGhibliData()
}

class GhibliInteractor: GhibliInteractorProtocol {
    
    weak var presenter: GhibliPresenterProtocol!
    
    private let service = NetworkDataFetcher(service: NetworkService())
    
    func getGhibliData() {
        service.getFilms { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movies):
                self.presenter.presentMovie(data: movies)
            case .failure(let error):
                self.presenter.presentError(message: error.localizedDescription)
            }
        }
    }
}
