//
//  ContentView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 13/02/2022.
//

import SwiftUI
import Resolver

struct MainView: View {
    @StateObject private var viewModel: MainViewModel = Resolver.resolve()
    
    init() {
        UITabBar.appearance().barTintColor = .systemGray5
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .systemGray5
    }
    
    var body: some View {
        TabView {
            
            NavigationView {
                ZStack {
                    Color(.systemGray5).ignoresSafeArea()
                    
                    switch(viewModel.state){
                        
                    case .inProgress:
                        ProgressView()
                            .progressViewStyle(.circular)
                    case .done:
                        HomeView(movieGenresMap: viewModel.movieGenresMap)
                            .navigationBarHidden(true)
                        
                    case let .error(message):
                        VStack{
                            Text(message)
                            Button("retry"){
                                viewModel.fetchMovies()
                            }
                            .padding(20)
                            
                        }
                        
                    default:
                        EmptyView()
                    }
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(1)
            
            MoviesSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(2)
        }.accentColor(.black)
            .onAppear{
                viewModel.fetchMovies()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
