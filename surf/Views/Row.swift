//
//  Row.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI

struct Row: View {
    
    var spot: ApiSpot
    
    var body: some View {
        HStack {
            Image(spot.fields.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(spot.fields.name)
        }
    }
}
//
//struct Row_Previews: PreviewProvider {
//    static var previews: some View {
//        Row(spot: spots[0])
//    }
//}
