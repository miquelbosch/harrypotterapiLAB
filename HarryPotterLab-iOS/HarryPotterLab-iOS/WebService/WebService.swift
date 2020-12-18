//
//  WebService.swift
//  HarryPotterLab-iOS
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

public final class WebService {
    
    // MARK: - Properties
    private let session: URLSession
    private let base = URL(string: "https://hp-api.herokuapp.com/")!
    private let decoder = JSONDecoder()
    
    // MARK: - Variables
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Initializers
    init(session: URLSession) {
        self.session = session
    }
    
    func load<T>(type: T.Type,
                         endpoint: WebServiceEndpoint,
                         completion completed: @escaping(Result<T, WebServiceError>) -> Void) where T: Decodable {
        
        let request = endpoint.request(base: base, parameters: [:])
        
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let error = error {
                completed(.failure(WebServiceError.mapServiceError(error: error as NSError)))
            }else {
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completed(.failure(.server))
                    return
                }
                
                if 200 ..< 300 ~= httpResponse.statusCode {
                    
                    if let data = data, let result = try? self.decoder.decode(T.self, from: data) {
                        completed(.success(result))
                    }else {
                        completed(.failure(.unexpected))
                    }
                    
                }else {
                    completed(.failure(.unexpected))
                }
            }
        })
        
        dataTask?.resume()
    }
}
