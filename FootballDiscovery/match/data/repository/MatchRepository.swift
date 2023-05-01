//  Created on 29/04/2023.

import Foundation
import Combine

protocol MatchRepository {
    func getMatches() -> AnyPublisher<[Match], Error>
    func getLineUp(fixtureId: Int) -> AnyPublisher<[Team], Error>
}

