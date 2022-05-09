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

struct ApiSpot: Decodable {
    var id: String
    var createdTime: String
    var fields: spotFields
    }

struct spotFields: Hashable, Decodable {
    var imageName: String
    var description: String
    var city: String
    var longitude: Double
    var country: String
    var latitude: Double
    var name: String
}

struct ApiList: Decodable {
    var records: [ApiSpot]
}
