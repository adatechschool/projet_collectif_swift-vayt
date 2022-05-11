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
            AsyncImage(url: URL(string: spot.fields.imageName))
            { image in
                image.resizable()
            } placeholder: {
                Color.white
            }
        .frame(width: 50, height: 50)
            Text(spot.fields.name)
        Spacer()
        
//        if spot.isFavorite {
//            Image(systemName: "star.fill")
//                .foregroundColor(.purple)
//        }
    }
}

}

//struct Row_Previews: PreviewProvider {
//    static var previews: some View {
//        Row(spot: spots[0])
//    }
//}
