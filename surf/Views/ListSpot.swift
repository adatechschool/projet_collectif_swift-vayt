//
//  List.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct ListSpot: View {
    
//    @State private var showFavoritesOnly = false
    
    @State var welcome = true
    
    @State var allSpots: [ShortSpot] = []
    
//    var filteredSpots: [ApiSpot] {
//        allSpots.filter { spot in
//            (!showFavoritesOnly || spot.isFavorite)
//        }
//    }
    
    func getData() {
        let urlString = "http://localhost:8080/list"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {
            apiSpot, _, error in
            DispatchQueue.main.async {
                if let apiSpot = apiSpot {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(ApiList.self, from: apiSpot)
                        self.allSpots = decodedData.Shortspots
                        welcome = false
                    } catch {
                        print("there is an error : \(error)")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {

        VStack {
            if welcome {
                VStack {
                Text("Welcome to the haunted app")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orange)
                    .padding()
                    Button("Let's get Spooky"){getData()}
                        .padding()
                        .foregroundColor(.purple)
                        .font(.title)
                        .background(Color(red: 0, green: 0, blue: 0))
                        .clipShape(Capsule())
            }.background(
                Image("jiji"))
            }
            else {
                NavigationView {
                    List(allSpots, id: \.idspot){
                        spot in NavigationLink{
                            SpotDetails(spotId:spot.idspot)
                        } label:{
                            Row(spot: spot)
                        }
                    }.navigationTitle("Spooky Places")
                }
                VStack {
                    Button("Refresh"){getData()}
                }
            }
        }
    }
}

struct ListSpot_Previews: PreviewProvider {
    static var previews: some View {
        ListSpot()
    }
}
