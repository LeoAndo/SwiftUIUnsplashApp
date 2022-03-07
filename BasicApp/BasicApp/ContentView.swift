//
//  ContentView.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem() {
                Image(systemName: "house.fill")
                Text("Home")
            }
            TodoView().tabItem() {
                Image(systemName: "pencil.circle.fill")
                Text("Todo")
            }
            SeachView().tabItem() {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
