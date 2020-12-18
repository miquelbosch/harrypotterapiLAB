//
//  CharactersViewController.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import UIKit

protocol CharacterView: class {
    var title: String? { get set }
    func setLoading()
    func update(characters: [Character])
}

protocol CharacterViewModelProtocol: class {
    var view: CharacterView? { get set }
    func fetchCharacters()
}

class CharactersViewController: UIViewController {
    
    let viewModel: CharacterViewModelProtocol
    
    init(viewModel: CharacterViewModelProtocol) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        view.backgroundColor = .green
    }
}

extension CharactersViewController: CharacterView {
    
    func setLoading() {
        
    }
    
    func update(characters: [Character]) {
        
    }
}
