//
//  SpotDetails.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct SpotDetails: View {
    
    var spot: Spot
    
//    func getSpot() {
//        let urlString = "
//        let url = URL(string: urlString)
//
//        URLSession.shared.dataTask(with: url!) {
//            data, _, error in do {
//                let decoder = JSONDecoder()
//                let decodedData: [Spot] = try! decoder.decode([Spot].self, from: spot)
//                self.spot = decodedData
//            } catch {
//                print("Error !")
//            }
//        }
//    }
    
    var body: some View {
        
        
            ScrollView {
                MapView(coordinate: spot.locationCoordinate) .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    .padding(.top, -20)
                
                CircleImg(image: spot.image)
                    .offset(y: -130)
                .padding(.bottom, -130)
            
                
                Text(spot.name)
                        .font(.title)
                        .padding()
                
            HStack{
                Text(spot.city)
                Spacer()
                Text(spot.country)
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text(spot.description)
                    }
                
        }
        
    }
}

struct SpotDetails_Previews: PreviewProvider {
    static var previews: some View {
        SpotDetails(spot: spots[0])
    }
}
