//
//  TabBar.swift
//  surf
//
//  Created by mohamed el amine zniber on 5/9/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            ListSpot()
                .tabItem{
                    Image(systemName: "list.bullet.circle")
                    Text("list")}

            AddSpot()
                .tabItem{
                    Image(systemName: "plus.viewfinder")
                    Text("Add")
                        }
                    
                       }
                }
        }
    


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        
    }
}
