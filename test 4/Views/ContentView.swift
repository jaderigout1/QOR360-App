//
//  ContentView.swift
//  SEED
//
//  Created by Machlan Pettersen on 10/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @State private var showProfile = false
    
    enum Tab {
        case home
        case motion
        case calories
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem{ Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            
            MotionView(motion: MotionView.MotionManager())
                .tabItem{ Label("Motion", systemImage: "figure.walk")
                }
                .tag(Tab.motion)
            
            CalorieView()
                .tabItem{ Label("Calories", systemImage: "flame")
                }
                .tag(Tab.calories)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(); MotionView(motion: MotionView.MotionManager())
        
    }
}
