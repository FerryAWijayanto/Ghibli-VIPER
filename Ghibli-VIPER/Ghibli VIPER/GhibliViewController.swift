//
//  GhibliViewController.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import UIKit

protocol GhibliViewProtocol: AnyObject {
    func displayMovies(viewModel: GhibliViewModel)
    func displayError(message: String)
}

class GhibliViewController: UIViewController {
    
    var filmViewModels = GhibliViewModel(cells: [])
    
    var presenter: GhibliPresenterProtocol!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
}

private extension GhibliViewController {
    func initialize() {
        view.backgroundColor = .systemBackground
        title = "Studio Ghibli"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        
        presenter.fetchMovies()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GhibliCell", bundle: nil), forCellReuseIdentifier: GhibliCell.cellID)
    }
}

extension GhibliViewController: GhibliViewProtocol {
    func displayMovies(viewModel: GhibliViewModel) {
        self.filmViewModels = viewModel
        tableView.reloadData()
    }
    
    func displayError(message: String) {
        print(message)
    }
}

extension GhibliViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmViewModels.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GhibliCell.cellID, for: indexPath) as! GhibliCell
        let viewModel = filmViewModels.cells[indexPath.row]
        
        cell.set(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = filmViewModels.cells[indexPath.row]
        presenter.didSelect(movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
