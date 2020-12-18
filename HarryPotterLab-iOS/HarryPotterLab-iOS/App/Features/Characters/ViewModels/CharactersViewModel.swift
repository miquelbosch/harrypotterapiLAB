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
        charactersRepository.characters { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let chareracters):
                self.view?.update(characters: chareracters.characters)
            case .failure(let error):
                break
            }
        }
    }
}
