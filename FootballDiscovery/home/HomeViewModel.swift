//  Created on 30/04/2023.

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let matchRepository: MatchRepository
    private var cancellables: Set<AnyCancellable> = []

    //output
    @Published var matches: [Match] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init(matchRepository: MatchRepository) {
        self.matchRepository = matchRepository
    }
    
    func fetchMatches() {
        isLoading = true
        matchRepository.getMatches()
            .receive(on: DispatchQueue.main).prefix(5).sink(receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.error = error
                        print("parsing error : \(error)")
                    case .finished:
                        break
                    }
            }, receiveValue: { [weak self] matches in
                    self?.matches = matches
            }).store(in: &cancellables)
    }
    
}
