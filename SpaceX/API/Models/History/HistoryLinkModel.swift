//
//  HistoryLinkModel.swift
//  SpaceX
//
// 
//

import Foundation

struct HistoryLinkModel : Codable {
    let reddit:    String?
    let article:  String?
    let wikipedia:  String?
    
    
    enum CodingKeys: String, CodingKey {
        case reddit    = "reddit"
        case article  = "article"
        case wikipedia  = "wikipedia"
       
    }
}
