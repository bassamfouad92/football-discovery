//  Created on 01/05/2023.

import SwiftUI

struct MatchDetailView: View {
    
    let match: Match
    
    @StateObject var viewModel: MatchDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                    Text("Loading details...")
                } else {
                    ScoreView(match: self.match)
                    Picker("Select Team", selection: $viewModel.selectedTeamIndex) {
                        Text(viewModel.teams.first?.name ?? match.teams.home.name).tag(0)
                        Text(viewModel.teams.last?.name ?? match.teams.away.name).tag(1)
                    }.pickerStyle(.segmented).padding([.leading, .trailing], 20)
                    /// formation
                    HStack {
                        Text("Formation")
                        Spacer()
                        Text(viewModel.formation).font(.title2).foregroundColor(.purple)
                    }.padding([.leading, .trailing], 20)
                    /// football field view
                    FootballFieldView(players: viewModel.players)
                }
            }.onAppear {
                viewModel.fetchTeams(id: match.fixture.id)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
