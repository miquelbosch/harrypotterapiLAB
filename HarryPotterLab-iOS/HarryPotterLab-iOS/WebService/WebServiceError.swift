//
//  WebServiceError.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

enum WebServiceError: LocalizedError {
    case unexpected
    case business
    case server
    case timeOut
    case unknow(error: NSError)
    
    // MARK: - Variables
    var description: String {
        switch self {
        case .unexpected, .business:
            return "Error ineserado."
        case .server:
            return "Error en la respuesta del servidor."
        case .timeOut:
            return "Error de conexión."
        case .unknow(let error):
            return error.localizedDescription
        }
    }
    
    // MARK: - Internal Methods
    static func mapServiceError(error: NSError) -> WebServiceError {
        
        switch error.code {
        case 000:
            return .unexpected
        case -1001:
            return .timeOut
        case 409:
            return .business
        default:
            return .unknow(error: error)

        }
    }
}
