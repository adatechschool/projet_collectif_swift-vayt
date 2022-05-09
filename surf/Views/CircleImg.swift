//
//  CircleImg.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI

struct CircleImg: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .clipShape(Circle())
            .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
            .shadow(radius: 7)
    }
}

struct CircleImg_Previews: PreviewProvider {
    static var previews: some View {
        CircleImg(imageName: "maison_du_diable")
    }
}
