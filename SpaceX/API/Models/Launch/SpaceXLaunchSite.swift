//
//  SpaceXLaunchSite.swift
//  SpaceX
//
//  
//

import Foundation

struct SpaceXLaunchSite: Codable {
    let siteID:       String?
    let siteName:     String?
    let siteNameLong: String?
    
    enum CodingKeys: String, CodingKey {
        case siteID       = "site_id"
        case siteName     =  "site_name"
        case siteNameLong = "site_name_long"
    }
}
