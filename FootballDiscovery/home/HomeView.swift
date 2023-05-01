//  Created on 30/04/2023.

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Section(header:
                                Text("\(viewModel.isLoading ? "Loading" : "Live") Matches").fontWeight(Font.Weight.bold)){
                        if viewModel.isLoading {
                            ProgressView().tint(.yellow)
                        } else {
                            MatchListView(matches: viewModel.matches)
                        }
                    }.onAppear {
                        if(viewModel.matches.isEmpty) {
                            viewModel.fetchMatches()
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.background(Color.black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: AppFactory.makeHomeViewModel())
    }
}
