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
        AsyncImage(url: URL(string: imageName)){ image in
            image.resizable()
        } placeholder: {
            Color.white
        }
        .frame(width: 128, height: 128)
            .clipShape(Circle())
            .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
            .shadow(radius: 7)
    }
}

struct CircleImg_Previews: PreviewProvider {
    static var previews: some View {
        CircleImg(imageName: "https://www.civitatis.com/blog/wp-content/uploads/2021/10/ile-poupees-mexique-1280x853.jpg")
    }
}
