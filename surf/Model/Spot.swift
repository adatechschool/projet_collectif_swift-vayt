//
//  Spot.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import Foundation
import SwiftUI
import CoreLocation

//struct Spot: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//    var city: String
//    var country: String
//    var description: String
//    var latitude: Double
//    var longitude: Double
//
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
//
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: latitude,
//            longitude: longitude)
//    }
//}

struct ApiList : Decodable {
    var Shortspots: [ShortSpot]
}

//struct ApiSpot: Decodable {
//    var id: String
//    var createdTime: String
// //   var isFavorite: Bool
//    var fields: spotFields
//    }

struct SpotFields: Decodable {
    var idspot: String
    var name: String
    var description: String
    var city: String
    var country: String
    var longitude: Double
    var latitude: Double
    var image_URL: String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}

struct ShortSpot: Decodable {
    var idspot: String
    var name: String
    var image_URL: String
}
