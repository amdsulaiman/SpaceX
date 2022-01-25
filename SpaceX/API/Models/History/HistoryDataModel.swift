//
//  HistoryDataModel.swift
//  SpaceX
//
//  
//

import Foundation

struct HistoryDataModel: Decodable {
    var id: Int?
    var title: String?
    var event_date_unix: Int?
    var flight_number: Int?
    var details: String?
    var links: HistoryLinkModel?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case event_date_unix = "event_date_unix"
        case flight_number = "flight_number"
        case details = "details"
        case links = "links"
    }
}

