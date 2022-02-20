//
//  GenreView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 14/02/2022.
//

import SwiftUI

struct GenreView: View {
    let genre: String
    let movies: [MovieModel]
    
    init(genre: String, movies: [MovieModel]){
        self.genre = genre
        self.movies = movies
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(genre)
                .foregroundColor(Color(.darkGray))
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 8) {
                    ForEach(0..<movies.count, id: \.self) { index in
                        NavigationLink(destination:
                                        MovieDetailsView(movie: movies[index])
                                        .background(Color(.systemGray5))
                        ) {
                            MovieItemView(imageUrl:movies[index].imageUrl)
                                .frame(
                                    width: UIConstants.MOVIE_FRAME.width,
                                    height: UIConstants.MOVIE_FRAME.height
                                )
                        }
                    }
                }
                .padding(.trailing)
            }
            
        }
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genre: "Genre 1", movies: [])
    }
}
