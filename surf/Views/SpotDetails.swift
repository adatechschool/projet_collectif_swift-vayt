//
//  SpotDetails.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct SpotDetails: View {
    
    @State var apiSpot = ApiSpot(
        id: "recGiehEmfmocsFqL",
        createdTime: "2022-05-05T09:50:33.000Z",
        fields: spotFields(
        imageName: "maison_du_diable",
        description: "Spooky !!",
        city: "Amityville",
        longitude: -73.414624,
        country: "USA",
        latitude: 40.66679,
        name: "Blabla"))
        
    var body: some View {
        
            ScrollView{
                MapView(coordinate: apiSpot.fields.locationCoordinate) .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    .padding(.top, -20)
                CircleImg(imageName: apiSpot.fields.imageName)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                Text(apiSpot.fields.name)
                        .font(.title)
                        .padding()
                
            HStack{
                Text(apiSpot.fields.city)
                Spacer()
                Text(apiSpot.fields.country)
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text(apiSpot.fields.description)
        }
    }
}
}
                
//struct SpotDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotDetails(spot: spots[0])
//    }
//}
