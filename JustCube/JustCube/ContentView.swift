//
//  ContentView.swift
//  JustCube
//
//  Created by Khai on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    @State var timer = Timer.publish(every: 2, on: RunLoop.main, in: RunLoop.Mode.common).autoconnect()
    var colors: [Color] = [Color.red, Color.blue, Color.green, Color.orange, Color.purple]
    
    var body: some View {
        ZStack {
            ForEach(colors.indices) { i in
                if index == i {
                    colors[i].transition(.cubeRotation)
                }
            }
            
        }
        .frame(width: 200, height: 200, alignment: .center)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.3)) {
                index = (index + 1) % colors.count
            }
        }
        
    }
}

#Preview {
    ContentView()
}
