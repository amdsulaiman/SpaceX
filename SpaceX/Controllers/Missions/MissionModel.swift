//
//  MissionModel.swift
//  SpaceX
//
//  
//

import Foundation
struct MissionModel: Decodable {
    var mission_name: String?
    var mission_id: String?
    var manufacturers: [String]?
    var payload_ids: [String]?
    var wikipedia: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case mission_name = "mission_name"
        case mission_id = "mission_id"
        case manufacturers = "manufacturers"
        case payload_ids = "payload_ids"
        case wikipedia = "wikipedia"
        case description = "description"
    }
}
