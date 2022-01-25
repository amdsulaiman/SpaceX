//
//  LaunchDataModel.swift
//  SpaceX
//
//  
//

import Foundation

struct LaunchDataModel: Decodable {
    let flightNumber:          Int?
    let missionName:           String?
    let missionID:             [String?]
    let launchYear:            String?
    let launchDateUnix:        Int?
    let launchDateUtc:         String?
    let launchDateLocal:       String?
    let isTentative:           Bool?
    let tentativeMaxPrecision: String?
    let tbd:                   Bool?
    let launchWindow:          Int?
    let rocket:                SpaceXLaunchRocket?
    let ships:                 [String?]
    let launchSite:            SpaceXLaunchSite?
    let launchSuccess:         Bool?
    let links:                 SpaceXLaunchLinks?
    let details:               String?
    let upcoming:              Bool?
    let staticFireDateUTC:     String?
    let staticFireDateUnix:    Int?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber          = "flight_number"
        case missionName           = "mission_name"
        case missionID             = "mission_id"
        case launchYear            = "launch_year"
        case launchDateUnix        = "launch_date_unix"
        case launchDateUtc         = "launch_date_utc"
        case launchDateLocal       = "launch_date_local"
        case isTentative           = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd                   = "tbd"
        case launchWindow          = "launch_window"
        case rocket                = "rocket"
        case ships                 = "ships"
        case launchSite            = "launch_site"
        case launchSuccess         = "launch_success"
        case links                 = "links"
        case details               = "details"
        case upcoming              = "upcoming"
        case staticFireDateUTC     = "static_fire_date_utc"
        case staticFireDateUnix    = "static_fire_date_unix"
    
    }
}
