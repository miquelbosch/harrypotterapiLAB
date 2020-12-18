//
//  AppCoordinator.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import UIKit

internal final class AppCoordinator {
    
    // MARK: - Variables
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    private(set) lazy var webServiceLocator: WebServiceServiceLocator = WebServiceServiceLocator()
    private(set) lazy var charactersCoordinator: CharactersCoordinator = CharactersCoordinator(webService: webServiceLocator)
}
