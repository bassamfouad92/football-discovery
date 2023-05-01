//  Created on 30/04/2023.

import Foundation

struct AppFactory {
    
    private static let client: HttpClient = URLSessionImp()
    
    static func makeHomeViewModel() -> HomeViewModel {
        let matchRepo: MatchRepository = MatchRemoteRepository(client: self.client)
        return HomeViewModel(matchRepository: matchRepo)
    }
    
    static func makeMatchDetailViewModel() -> MatchDetailViewModel {
        let matchRepo: MatchRepository = MatchRemoteRepository(client: self.client)
        return MatchDetailViewModel(matchRepository: matchRepo)
    }
}
