//
//  CharactersRepository.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func characters(completion completed: @escaping (Result<[Character], WebServiceError>) -> Void)
}


final class CharactersRepository: CharactersRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func characters(completion completed: @escaping (Result<[Character], WebServiceError>) -> Void) {
        
        webService.load(type: [Character].self,
                        endpoint: .characters) { result in
                            
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let characters):
                                    let film = characters
                                    completed(.success(characters))
                                case .failure(let error):
                                    completed(.failure(error))
                                }
                            }
        }
    }
    
}
