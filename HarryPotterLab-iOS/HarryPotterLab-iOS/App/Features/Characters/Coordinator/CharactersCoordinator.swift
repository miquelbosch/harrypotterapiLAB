//
//  CharactersCoordinatos.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import UIKit

public final class CharactersCoordinator {
    
    // MARK: - Propierties
    let webService: WebServiceServiceLocator
    
    init(webService: WebServiceServiceLocator) {
        self.webService = webService
    }
    
    public func viewController() -> UIViewController {
        
        return CharactersViewController(viewModel: viewModel())
    }
    
    private func viewModel() -> CharacterViewModelProtocol {
        return CharactersViewModel(charactersRepository: charachterRepository())
    }
    
    private func charachterRepository() -> CharactersRepositoryProtocol {
        
        return CharactersRepository(webService: webService.webService)
    }
    
}
