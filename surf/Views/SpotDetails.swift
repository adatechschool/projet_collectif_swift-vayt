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
    
    
    var spot : Spot
    
//    func getData() {
//        let urlString = "https://api.airtable.com/v0/appI8YDBcRniNVt9u/Spots?api_key=keyUf2J6tpBtwzKyG"
//        let url = URL(string: urlString)
//        URLSession.shared.dataTask(with: url!) {
//            apiSpot, _, error in
//            DispatchQueue.main.async {
//                if let apiSpot = apiSpot {
//                    do {
//                        let decoder = JSONDecoder()
//                        let decodedData = try decoder.decode(ApiList.self, from: apiSpot)
//                        self.apiSpot = decodedData
//                    } catch {
//                        print("there is an error : \(error)")
//                    }
//                }
//            }
//        }.resume()
//    }
        
    var body: some View {
        
            ScrollView{
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
//                Button("Refresh"){self.getData()}
        }
    }
}
}
                
//struct SpotDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotDetails(spot: spots[0])
//    }
//}
