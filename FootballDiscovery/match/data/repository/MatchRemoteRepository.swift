//  Created on 29/04/2023.

import Foundation
import Combine

class MatchRemoteRepository: MatchRepository {
    
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
    
    func getMatches() -> AnyPublisher<[Match], Error> {
        
        let endpoint = Endpoint.fixtures()

        let publisher = client.get(type: MatchResponse.self, url: endpoint.url, headers: endpoint.headers).map { $0.response }
        
        return publisher.eraseToAnyPublisher()
    }
    
    func getLineUp(fixtureId: Int) -> AnyPublisher<[Team], Error> {
        
        let endpoint = Endpoint.lineup(id: fixtureId)

        let publisher = client.get(type: LineUpResponse.self, url: endpoint.url, headers: endpoint.headers).map { $0.response }.map {
            $0.map {
                $0.mapToTeam()
            }
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
