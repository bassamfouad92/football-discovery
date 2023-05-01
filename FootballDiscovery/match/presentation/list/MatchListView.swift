//  Created on 30/04/2023.

import SwiftUI

struct MatchListView: View {
    
    let matches: [Match]

    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach (matches) { match in
                        NavigationLink(destination:  MatchDetailView(match: match, viewModel: AppFactory.makeMatchDetailViewModel())) {
                               MatchListItem(match: match)
                            }
                    }
                }.padding(30)
            }
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView(matches: [])
    }
}
