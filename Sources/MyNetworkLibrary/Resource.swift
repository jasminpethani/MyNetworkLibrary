//
//
//  Package Name: 
//  Product Name: 
//  Project Name: 
//
//  Created by JASMIN PETHANI on 17/06/22 and 12:12


import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

public struct Resource<T: Decodable> {
    let url: URL
    let httpMethod: HTTPMethod
    let body: Data?
    
    public init(url: URL, body: Data?, method: HTTPMethod = .get) {
        self.url = url
        self.body = body
        self.httpMethod = method
    }
    
    public init(url: URL) {
        self.init(url: url, body: nil)
    }
    
    func getURLRequest() -> URLRequest {
        var request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 3000)
        request.httpMethod = self.httpMethod.rawValue
        if !([.get, .delete].contains(httpMethod)) && body != nil {
            request.httpBody = body
        }
        return request
    }
}
