//
//  GhibliInteractor.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

protocol GhibliInteractorProtocol: AnyObject {
    func getGhibliData()
    func numberOfSection() -> Int
    func cellViewModel(at indexPath: IndexPath) -> GhibliViewModel.Cell
    func didSelectMovie(at index: IndexPath)
}

class GhibliInteractor: GhibliInteractorProtocol {
    
    weak var presenter: GhibliPresenterOutput!
    
    private var filmViewModels = GhibliViewModel(cells: [])
    
    private let service = NetworkDataFetcher(service: NetworkService())
    
    func getGhibliData() {
        service.getFilms { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movies):
                let movieItems = movies.map { self.ghibliViewModel(from: $0) }
                let ghibliItemViewModel = GhibliViewModel(cells: movieItems)
                self.filmViewModels = ghibliItemViewModel
                
                self.presenter.presentMovie(data: ghibliItemViewModel)
            case .failure(let error):
                self.presenter.presentError(message: error.localizedDescription)
            }
        }
    }
    
    func numberOfSection() -> Int {
        filmViewModels.cells.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> GhibliViewModel.Cell {
        filmViewModels.cells[indexPath.row]
    }
    
    func didSelectMovie(at index: IndexPath) {
        let movie = filmViewModels.cells[index.row]
        presenter.presentToDetail(movie)
    }
}

extension GhibliInteractor {
    private func ghibliViewModel(from movieItem: Film) -> GhibliViewModel.Cell {
        return GhibliViewModel.Cell(imageName: movieItem.image, movieTitle: movieItem.title, releaseDate: movieItem.releaseDate, description: movieItem.description)
    }
}
