//
//  Characters.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

//struct Characters {
//
//}

struct Character: Codable {
    let name: String
    //let age: Int
}


struct CharactersResponse: Codable {
    
    let characters: [Character]
}

final class CharactersBinding {
    
    static func bind(_ soaCharactersResponse: CharactersResponse) -> [Character] {
        
        let characters = soaCharactersResponse.characters
        print(characters)
        
        return []
    }
}
