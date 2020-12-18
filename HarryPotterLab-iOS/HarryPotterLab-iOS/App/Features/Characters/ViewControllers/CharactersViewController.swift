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
    func setLoading(isLoading: Bool)
    func update(characters: [Character])
}

protocol CharacterViewModelProtocol: class {
    var view: CharacterView? { get set }
    func fetchCharacters()
}

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var activityIndicatorContainerView: UIView!
    
    let viewModel: CharacterViewModelProtocol
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let frame = CGRect(x: 0,
                           y: 0,
                           width: 60,
                           height: 40)
        let activityIndicator = UIActivityIndicatorView(frame: frame)
        activityIndicator.color = #colorLiteral(red: 0.1921568627, green: 0.631372549, blue: 0.5411764706, alpha: 1)
        activityIndicator.tintColor = #colorLiteral(red: 0.1921568627, green: 0.631372549, blue: 0.5411764706, alpha: 1)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = .green
        return activityIndicator
    }()
    
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
        
        activityIndicatorContainerView.addSubview(activityIndicator)
        
        activityIndicator.anchor(top: activityIndicatorContainerView.topAnchor,
                                 left: activityIndicatorContainerView.leftAnchor,
                                 bottom: activityIndicatorContainerView.bottomAnchor,
                                 right: activityIndicatorContainerView.rightAnchor)
        
        viewModel.fetchCharacters()
        view.backgroundColor = .green
    }
}

extension CharactersViewController: CharacterView {
    
    func setLoading(isLoading: Bool) {
        _ = isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func update(characters: [Character]) {
        
    }
}
