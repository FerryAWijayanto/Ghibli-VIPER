//
//  GhibliRouter.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation
import UIKit

protocol GhibliRouterProtocol {
    init(viewController: GhibliViewController)
    func pushToDetail(movie: GhibliViewModel.Cell)
}

class GhibliRouter: GhibliRouterProtocol {
    unowned let viewController: GhibliViewController
        
    required init(viewController: GhibliViewController) {
        self.viewController = viewController
    }
    
    func pushToDetail(movie: GhibliViewModel.Cell) {
        let detailVC = DetailViewController()
        detailVC.movie = movie
        
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
