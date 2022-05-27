//
//  SpotDetails.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct SpotDetails: View {
    
    @State var spotId: String
    
    @State var apiSpot: SpotFields = SpotFields(idspot: "", name: "", description: "", city:"", country:"", longitude:0, latitude:0, image_URL:"")
   
    func getSpot() {
        let urlString = "http://localhost:8080/spot/" + spotId
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {
            spot, _, error in
            DispatchQueue.main.async {
                if let spot = spot {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(SpotFields.self, from: spot)
                        self.apiSpot = decodedData
                        print(apiSpot)
                    } catch {
                        print("there is an error : \(error)")
                    }
                }
            }
        }.resume()
    }


    var body: some View {
//        VStack {
//            Button("Get SPOT"){getSpot()}
//        }

         ScrollView{
                MapView(coordinate: apiSpot.locationCoordinate) .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    .padding(.top, -20)
                CircleImg(imageName: apiSpot.image_URL)
                    .offset(y: -70)
                    .padding(.bottom, -60)
                Text(apiSpot.name)
                        .font(.title)
                        .padding()

            HStack{
                Text(apiSpot.city)
                Spacer()
                Text(apiSpot.country)
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                Text(apiSpot.description)
        }
    }.onAppear{self.getSpot()}
}
}

    
                
//struct SpotDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotDetails(spot: spots[0])
//    }
//}
