//
//  GhibliBuilder.swift
//  Ghibli-VIPER
//
//  Created by Ferry Adi Wijayanto on 18/11/21.
//

import Foundation
import UIKit

protocol BuildModuleProtocol {
    static func build() -> UINavigationController
}

class GhibliBuilder: BuildModuleProtocol {
    static func build() -> UINavigationController {
        let viewController: GhibliViewController = GhibliViewController.loadFromStoryboard()
        let presenter = GhibliPresenter()
        let interactor = GhibliInteractor()
        let router = GhibliRouter(viewController: viewController)
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.presenter = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
}
