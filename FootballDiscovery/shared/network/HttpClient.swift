//  Created on 29/04/2023.

import Foundation
import Combine

protocol HttpClient {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
}

struct URLSessionImp: HttpClient {
    
    func get<T: Decodable>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: urlRequest).map {
            (data: Data, response: URLResponse) in
              data
        }.decode(type: T.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        
        return publisher
    }
}

