//
//  WebServiceServiceLocator.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

public final class WebServiceServiceLocator {
    
    // MARK: - Variables
    private(set) lazy var urlSession = URLSession(configuration: .default)
    private(set) lazy var webService = WebService(session: urlSession)
    
    // MARK: - Initializers
    public init() {}
}
