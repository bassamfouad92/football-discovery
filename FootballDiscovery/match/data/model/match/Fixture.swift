//  Created on 29/04/2023.

import Foundation

struct Fixture: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String
    let timestamp: Int
    let venue: Venue
    let status: Status
}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let city: String?
}

struct Status: Codable {
    let long: String?
    let short: String?
    let elapsed: Int?
}
