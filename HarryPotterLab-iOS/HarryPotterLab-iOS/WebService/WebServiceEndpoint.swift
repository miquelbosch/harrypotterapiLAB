//
//  WebServiceEndPoint.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

public enum Method: String {
    case get = "GET"
    case post = "POST"
}

enum WebServiceEndpoint {
    case characters
}

extension WebServiceEndpoint {
    
    public var method: Method {
        switch self {
        case .characters:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .characters:
            return ""
        }
    }
    
    public var parameters: [String: String] {
        switch self {
        case .characters:
            return [:]
        }
    }
}

extension WebServiceEndpoint {
    
    public func request(base: URL, parameters: [String: String]) -> URLRequest {
        
        let url = base.appendingPathComponent("jsjsj")
        
        let parameters = self.parameters
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}
