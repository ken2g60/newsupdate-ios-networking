//
//  Symptom.swift
//  HealthT
//
//  Created by knight on 10/12/20.
//

import Foundation


struct Location: Codable {
    var longtitude: Float
    var latitude: Float
}

struct NewsUpdate: Codable {
    var title: String = ""
    var image: String = ""
    var location: [Location]?
    var category: String = ""
    var content: String = ""
    var publisher: String = ""
    var website: String = ""
    var source: String = ""
    var label: String = ""
    var country: String = ""
    var created_at: String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case location = "location"
        case category
        case content
        case publisher
        case website
        case source
        case label = "label"
        case country = "country"
        case created_at = "created_at"
    }
    
    enum LocationKeys: String, CodingKey {
        case latitude = "latitude"
        case longtitude = "longtitude"
    }

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(String.self, forKey: .image)

        category = try container.decode(String.self, forKey: .category)
        content = try container.decode(String.self, forKey: .content)
        publisher = try container.decode(String.self, forKey: .publisher)
        website = try container.decode(String.self, forKey: .website)
        source = try container.decode(String.self, forKey: .source)
        label = try container.decode(String.self, forKey: .label)
        country = try container.decode(String.self, forKey: .country)
        created_at = try container.decode(String.self, forKey:  .created_at)
    }
}


struct NewsUpdateDataStore: Decodable {
    var news: [NewsUpdate]
}
