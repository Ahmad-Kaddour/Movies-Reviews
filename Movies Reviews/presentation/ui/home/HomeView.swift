//
//  HomeView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 14/02/2022.
//

import SwiftUI

struct HomeView: View {
    let movieGenresMap: [String: [MovieModel]]
    
    init(movieGenresMap: [String: [MovieModel]]){
        self.movieGenresMap = movieGenresMap
    }
    
    var body: some View {
        VStack{
            ScrollView() {
                
                Text("WOOKIE\nMOVIES")
                    .font(.largeTitle)
                    .foregroundColor(Color(.darkGray))
                
                LazyVStack(spacing: 40) {
                    ForEach(Array(movieGenresMap.keys), id: \.self) { key in
                        GenreView(genre: key, movies: movieGenresMap[key] ?? [])
                    }
                }
            }
        }
        .padding(.leading)
    }
}
