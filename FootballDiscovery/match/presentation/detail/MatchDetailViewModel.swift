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
    @Published var selectedTeamIndex: Int = 0
    @Published var formation: String = "-"

    var selectedTeamIndexPublisher: AnyPublisher<Int, Never> {
            $selectedTeamIndex.eraseToAnyPublisher()
    }
    
    init(matchRepository: MatchRepository) {
        self.matchRepository = matchRepository
        
        //segment selection
        $selectedTeamIndex.sink { [weak self] index in
            self?.assignPlayer(index: index)
        }.store(in: &cancellables)
    }
    
    private func assignPlayer(index: Int) {
        if teams.isEmpty {
            return
        }
        self.players = self.teams[index].players.map {
            $0.map { ViewMapper.mapPlayer(player: $0)}
        } ?? []
        self.formation = self.teams[index].formation ?? "-"
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
                self?.assignPlayer(index: 0)
            }.store(in: &cancellables)
    }
}
