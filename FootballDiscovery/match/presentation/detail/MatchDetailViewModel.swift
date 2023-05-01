//  Created on 01/05/2023.

import Foundation
import Combine

class MatchDetailViewModel: ObservableObject {
    
    private let matchRepository: MatchRepository
    private var cancellables: Set<AnyCancellable> = []

    
    //output
    @Published var teams: [Team] = []
    @Published var players: [PlayerViewData] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var selectedTeamIndex = 0

    init(matchRepository: MatchRepository) {
        self.matchRepository = matchRepository
        
        _ = $selectedTeamIndex.map {
            self.assignPlayer(index: $0)
        }
    }
    
    private func assignPlayer(index: Int) {
        if teams.isEmpty {
            return
        }
        self.players = self.teams[index].players.map {
            $0.map { ViewMapper.mapPlayer(player: $0)}
        } ?? []
    }
    
    func fetchTeams(id: Int) {
        isLoading = true
        matchRepository.getLineUp(fixtureId: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                print(completion)
                switch completion {
                  case .failure(let error):
                    self?.error = error
                  case .finished:
                    break
                }
                
            }) { [weak self] teams in
                self?.teams = teams
                self?.teams.forEach {
                    print("\($0.name)")
                    print("\($0.players?.first?.name)")
                }
            }.store(in: &cancellables)
    }
}
