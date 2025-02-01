//
//  mission.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 14/07/1446 AH.
//

import Foundation

struct Mission : Codable , Identifiable{
    
    struct CrewRole: Codable {
        let name : String
        let role : String
    }
    
    let id : Int
    let launchDate: Date?
    let crew : [CrewRole]
    let description : String
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
}
