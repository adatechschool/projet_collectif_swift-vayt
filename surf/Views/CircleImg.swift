//
//  CircleImg.swift
//  surf
//
//  Created by Victoire Stahl on 04/05/2022.
//

import SwiftUI

struct CircleImg: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
            .shadow(radius: 7)
    }
}

struct CircleImg_Previews: PreviewProvider {
    static var previews: some View {
        CircleImg(image: Image(  "maison_du_diable"))
    }
}
