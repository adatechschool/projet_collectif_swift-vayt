//
//  List.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI
import Foundation

struct ListSpot: View {
    
    var body: some View {
        NavigationView {
            
            
            List(spots) { spot in NavigationLink{
                SpotDetails(spot: spot)
            } label:{
                Row(spot: spot)
            }
            }
            .navigationTitle("Spooky Place Of Terror")
        }
    }
}

struct ListSpot_Previews: PreviewProvider {
    static var previews: some View {
        ListSpot()
    }
}
