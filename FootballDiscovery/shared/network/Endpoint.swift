//  Created on 30/04/2023.

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "v3.football.api-sports.io"
        components.path =  path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "x-rapidapi-host": "v3.football.api-sports.io",
            "x-rapidapi-key" : "85015d79dd8246fd53b25117de65f377"
        ]
    }
    
    static func fixtures() -> Self {
        return Endpoint.init(path: "/fixtures",
                             queryItems: [
                                    URLQueryItem(name: "live", value: "all")
                                ]
        )
    }
    
    static func lineup(id: Int) -> Self {
        return Endpoint.init(path: "/fixtures/lineups",
                             queryItems: [
                                    URLQueryItem(name: "fixture", value: "\(id)")
                                ]
        )
    }
}
