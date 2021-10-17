//
//  GetConcerts.swift
//  HornsApp-iOS
//
//  Created by Yesferal Cueva on 16/10/21.
//

import Foundation

struct GetConcerts: Decodable {
    var _id: String
    var name: String?
    var headlinerImage: String?
    var dateTime: String?
    var genre: String?
    var tags: [String]?
    var ticketingUrl: String?
    var ticketingHost: String?
    
    enum CodingKeys: String, CodingKey {
        case _id
        case name
        case headlinerImage
        case dateTime
        case genre
        case tags
        case ticketingUrl
        case ticketingHost
    }
}
