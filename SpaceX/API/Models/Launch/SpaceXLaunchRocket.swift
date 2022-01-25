//
//  SpaceXLaunchRocket.swift
//  SpaceX
//
//  
//

import Foundation

struct SpaceXLaunchRocket: Codable {
    let rocketID:    String?
    let rocketName:  String?
    let rocketType:  String?
    
    
    enum CodingKeys: String, CodingKey {
        case rocketID    = "rocket_id"
        case rocketName  = "rocket_name"
        case rocketType  = "rocket_type"
       
    }
}
