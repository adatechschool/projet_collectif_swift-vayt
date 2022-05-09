//
//  Spot.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Spot: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var country: String
    var description: String
    var latitude: Double
    var longitude: Double
    
//    enum CodingKeys: String, Int, Double, CodingKey {
//        case id: ""
//        case name: "name"
//        case city: "city"
//        case country: "country"
//        case description: "description"
//        case latitude: "latitude"
//        case longitude: "longitude"
//    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
    
}

