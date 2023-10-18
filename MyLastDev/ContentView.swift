//
//  ContentView.swift
//  MyLastDev
//
//  Created by Fani on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("Start live activity", action: _startLiveActivity).padding(10.0)
            Button("End live activity", action: _endLiveActivity).padding(10.0)
        }
        .padding()
    }
    
    func _startLiveActivity() {
        
    }
    
    func _endLiveActivity() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
