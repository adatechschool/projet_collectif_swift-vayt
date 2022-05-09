//
//  List.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct ListSpot: View {
    
    @State var allSpots = ApiList(records: [ApiSpot(
        id: "recGiehEmfmocsFqL",
        createdTime: "2022-05-05T09:50:33.000Z",
        fields: spotFields(
        imageName:"https://www.stickersmalin.com/images/ajoute/prd/115/115121-image_448x448.png",
        description: "Spooky !!",
        city: "Amityville",
        longitude: -73.414624,
        country: "USA",
        latitude: 40.66679,
        name: "Some haunted house"))])
    
    
    func getData() {
    let urlString = "https://api.airtable.com/v0/appI8YDBcRniNVt9u/Spots?api_key=keyUf2J6tpBtwzKyG"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {
            apiSpot, _, error in
            DispatchQueue.main.async {
                if let apiSpot = apiSpot {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(ApiList.self, from: apiSpot)
                        self.allSpots = decodedData
                    } catch {
                        print("there is an error : \(error)")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {

        VStack {
            NavigationView {
                List(allSpots.records, id: \.id){
                    spot in NavigationLink{
                        SpotDetails(apiSpot: spot)
                    } label:{
                        Row(spot: spot)
                    }
                }.navigationTitle("Spooky Place Of Terror")
            }
            VStack {
                Button("Refresh"){getData()}
            }
        }
}
}

struct ListSpot_Previews: PreviewProvider {
    static var previews: some View {
        ListSpot()
    }
}
