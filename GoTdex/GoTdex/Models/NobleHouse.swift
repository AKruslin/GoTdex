//
//  NobleHouse.swift
//  GoTdex
//
//  Created by COBE on 22/01/2021.
//

import Foundation

struct NobleHouse: Codable, Identifiable {
    let id = UUID()
    let url: String
    let name, region, coatOfArms, words: String
    let titles, seats: [String]
    let currentLord: String
    let founded: String
}
