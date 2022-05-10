//
//  AddSpot.swift
//  surf
//
//  Created by mohamed el amine zniber on 5/9/22.
//

import SwiftUI



struct AddSpot: View {
    
    @State var city: String = ""
    
    var body: some View {
        SpotForm()
        .navigationTitle("Add a spot")
    }
}

struct AddSpot_Previews: PreviewProvider {
    static var previews: some View {
        AddSpot()
    }
}
