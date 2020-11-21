//
//  Location.swift
//  HealthT
//
//  Created by knight on 10/13/20.
//

import Foundation


struct Location: Codable {
    
    var name: String = ""
    var Healthlongitutde: String = ""
    var Healthlatitude: String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case Healthlongitutde
        case Healthlatitude
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        Healthlongitutde = try values.decode(String.self, forKey: .Healthlongitutde)
        Healthlatitude = try values.decode(String.self, forKey: .Healthlatitude)
    }
    
}



struct LocationDataStore: Codable {
    var locations: [Location]
}
