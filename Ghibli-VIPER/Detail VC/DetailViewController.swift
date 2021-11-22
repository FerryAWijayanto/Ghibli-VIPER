//
//  DetailViewController.swift
//  Ghibli-VIPER
//
//  Created by Ferry Adi Wijayanto on 18/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: GhibliViewModel.Cell!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = movie.movieTitle
    }

}
