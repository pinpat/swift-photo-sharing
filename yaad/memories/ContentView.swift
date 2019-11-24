//
//  ContentView.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/13/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var store: Store = Store()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                    NavigationLink(destination: MemoryBookScreen()){
                         BlockView(title: "Memory Book", backgroundColor:Color("Primary"))
                    }
                
                NavigationLink(destination: CreatorScreen()){
                    BlockView(title: "Creator", backgroundColor:Color("Gray"))
                }
            
                }.edgesIgnoringSafeArea(.all)
        }
        
    
    }
}




struct BlockView: View {
    var title: String
    var backgroundColor: Color
    var body: some View{
        Text(title)
        .fontWeight(Font.Weight.bold)
            .font(.system(size: 50))
        .foregroundColor(Color.white)
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(backgroundColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
