//
//  GhibliPresenter.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

protocol GhibliPresenterInput: AnyObject {
    func fetchMovies()
    func numberOfRowsInSection() -> Int
    func viewModel(at indexPath: IndexPath) -> GhibliViewModel.Cell
    func pushMovie(at indexPath: IndexPath)
}

protocol GhibliPresenterOutput: AnyObject {
    func presentMovie(data: GhibliViewModel)
    func presentError(message: String)
    func presentToDetail(_ movie: GhibliViewModel.Cell)
}

class GhibliPresenter: GhibliPresenterInput {
    weak var view: GhibliViewProtocol!
    var interactor: GhibliInteractorProtocol!
    var router: GhibliRouterProtocol!
    
    func fetchMovies() {
        interactor.getGhibliData()
    }
    
    func numberOfRowsInSection() -> Int {
        interactor.numberOfSection()
    }
    
    func viewModel(at indexPath: IndexPath) -> GhibliViewModel.Cell {
        interactor.cellViewModel(at: indexPath)
    }
    
    func pushMovie(at indexPath: IndexPath) {
        interactor.didSelectMovie(at: indexPath)
    }
}

extension GhibliPresenter: GhibliPresenterOutput {
    
    func presentMovie(data: GhibliViewModel) {
        view.reloadMovie()
    }
    
    func presentError(message: String) {
        view.displayError(message: message)
    }
    
    func presentToDetail(_ movie: GhibliViewModel.Cell) {
        router.pushToDetail(movie: movie)
    }
}
