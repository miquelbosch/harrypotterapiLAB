//
//  WebServiceTest.swift
//  HarryPotterLab-iOSTests
//
//  Created by Miquel Bosch on 18/12/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import XCTest

@testable import HarryPotterLab_iOS

private class URLSessionDataMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

private class URLSessionMock: URLSession {
    
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    init(configuration: URLSessionConfiguration? = nil) {}
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        let data = self.data
        let response = self.response
        let error = self.error
        
        return URLSessionDataMock {
            completionHandler(data, response, error)
        }
    }
}

class WebServiceTest: XCTestCase {
    
    //MARK: - Constants
    private struct Constants {
        static let baseUrl: URL = URL(string: "www.test.com")!
    }
    
    //MARK: - Variables
    private var mockedSession: URLSessionMock?
    private var sut: WebService?
    
    

    override func setUp() {
        
        mockedSession = URLSessionMock()
        sut = WebService(session: mockedSession!)
    }

    override func tearDown() {
        super.tearDown()
        mockedSession = nil
        sut = nil
    }
    
    func test_callService_failure01() {
        
        XCTAssertNil(mockedSession?.error)
        let error = NSError(domain: "domain", code: 000, userInfo: nil)
        mockedSession?.error = error
        
        //sut?.load(type: <#T##Decodable.Protocol#>, endpoint: <#T##<<error type>>#>, completion: <#T##<<error type>>#>)
        
        
        
    }

}
