//  Created by JASMIN PETHANI on 10/06/22 and 12:28

import Foundation
import Combine

public protocol NetworkserviceProtocol {
    func fetch<M: Decodable>(url:URL, modelType: M.Type) -> AnyPublisher<M, Error>
}

public final class WebService: NetworkserviceProtocol {
    public func fetch<M: Decodable>(url:URL, modelType: M.Type) -> AnyPublisher<M, Error> {
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: modelType, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
