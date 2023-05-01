//  Created on 29/04/2023.

import SwiftUI

@main
struct FootballDiscoveryApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: AppFactory.makeHomeViewModel())
        }
    }
}
