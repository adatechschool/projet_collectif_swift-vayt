//
//  SpotDetails.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct SpotDetails: View {
    
    @State var apiSpot: ApiSpot
    
    var body: some View {
        
            ScrollView{
                MapView(coordinate: apiSpot.fields.locationCoordinate) .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    .padding(.top, -20)
                CircleImg(imageName: apiSpot.fields.imageName)
                    .offset(y: -70)
                    .padding(.bottom, -60)
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
