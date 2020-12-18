//
//  CharactersViewModel.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation



final class CharactersViewModel {
    
    let charactersRepository: CharactersRepositoryProtocol
    
    weak var view: CharacterView?
    
    init(charactersRepository: CharactersRepositoryProtocol) {
        self.charactersRepository = charactersRepository
    }
}

extension CharactersViewModel: CharacterViewModelProtocol {
    
    func fetchCharacters() {
        
        view?.setLoading(isLoading: true)
        
        charactersRepository.characters { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let characters):
                self.view?.update(characters: characters)
                self.view?.setLoading(isLoading: false)
            case .failure(let error):
                self.view?.setLoading(isLoading: false)
                break
            }
        }
    }
}
