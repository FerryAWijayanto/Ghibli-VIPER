//
//  GhibliPresenter.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

protocol GhibliPresenterProtocol: AnyObject {
    func fetchMovies()
    func didSelect(_ movie: GhibliViewModel.Cell)
    
    func presentMovie(data: [Film])
    func presentError(message: String)
}

class GhibliPresenter: GhibliPresenterProtocol {
    weak var view: GhibliViewProtocol!
    var interactor: GhibliInteractorProtocol!
    var router: GhibliRouterProtocol!
    
    func fetchMovies() {
        interactor.getGhibliData()
    }
    
    func presentMovie(data: [Film]) {
        let movieItems = data.map { ghibliViewModel(from: $0) }
        let ghibliItemViewModel = GhibliViewModel(cells: movieItems)
        
        view.displayMovies(viewModel: ghibliItemViewModel)
    }
    
    func presentError(message: String) {
        view.displayError(message: message)
    }
    
    func didSelect(_ movie: GhibliViewModel.Cell) {
        router.pushToDetail(movie: movie)
    }
}

extension GhibliPresenter {
    private func ghibliViewModel(from movieItem: Film) -> GhibliViewModel.Cell {
        return GhibliViewModel.Cell(imageName: movieItem.image, movieTitle: movieItem.title, releaseDate: movieItem.releaseDate, description: movieItem.description)
    }
}
