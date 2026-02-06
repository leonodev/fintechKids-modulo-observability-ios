//
//  ContentView.swift
//  FHKObservabilityDemo
//
//  Created by Fredy Leon on 6/2/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            
            HStack {
                Button(
                    action: {
                        viewModel.logEventDummy()
                    },
                    label: {
                        Text("Log Event")
                            .foregroundStyle(Color.white)
                            .padding()
                            
                    }
                )
                .background(Color.indigo)
            }
            .padding(.all, 24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
