//
//  GhibliViewController.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import UIKit

protocol GhibliViewProtocol: AnyObject {
    func reloadMovie()
    func displayError(message: String)
}

class GhibliViewController: UIViewController {
    
    var presenter: GhibliPresenterInput!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
}

// MARK: - Setup
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

// MARK: - View Protocol
extension GhibliViewController: GhibliViewProtocol {
    func reloadMovie() {
        tableView.reloadData()
    }
    
    func displayError(message: String) {
        print(message)
    }
}

// MARK: - UITableView DataSource and Delegate
extension GhibliViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GhibliCell.cellID, for: indexPath) as! GhibliCell
        let viewModel = presenter.viewModel(at: indexPath)
        
        cell.set(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushMovie(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
