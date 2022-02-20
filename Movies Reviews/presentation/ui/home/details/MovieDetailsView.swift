//
//  MovieDetailsView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 14/02/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieModel
    
    init(movie: MovieModel){
        self.movie = movie
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 0){
                MovieHeadingView(movie: movie)
                
                Spacer(minLength: UIConstants.MOVIE_FRAME.height / 2)
                    .fixedSize()
                
                VStack(alignment: .leading, spacing: UIConstants.X_PADDING){
                    HStack{
                        Text(movie.year)
                        Text("|")
                        Text(movie.length)
                        Text("|")
                        Text(movie.director)
                    }
                    .lineLimit(1)
                    
                    Text("cast: " + movie.cast.joined(separator: ", "))
                    
                    Text("movie description: " + movie.overview)
                }
                .padding(.horizontal, UIConstants.H_PADDING)
                .padding(.vertical, UIConstants.XX_PADDING)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//MARK: - Movie Details Heading
private struct MovieHeadingView: View {
    private let ASPECT_RATIO = 0.6
    
    let movie: MovieModel
    
    init(movie: MovieModel){
        self.movie = movie
    }
    
    var body: some View {
        SingleAxisGeometryReader { width in
            
            ZStack(alignment: .leading){
                
                MovieItemView(imageUrl: movie.backdropUrl)
                    .frame(
                        width: width,
                        height: width * ASPECT_RATIO
                    )
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                MovieItemView(imageUrl: movie.imageUrl)
                    .frame(
                        width: UIConstants.MOVIE_FRAME.width,
                        height: UIConstants.MOVIE_FRAME.height
                    )
                    .offset(y: width * ASPECT_RATIO / 2)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: CGFloat(UIConstants.H_PADDING),
                            bottom: 0,
                            trailing: UIConstants.H_PADDING
                        )
                    )
                
                Text(String(format: "\(movie.title) (%.1f)", movie.rating))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                    .truncationMode(.middle)
                    .padding(5)
                    .background(
                        Color.white
                            .opacity(0.5)
                            .cornerRadius(5.0)
                    )
                    .frame(
                        maxWidth: width - UIConstants.MOVIE_FRAME.width - UIConstants.H_PADDING * 3,
                        maxHeight: 50,
                        alignment: .leading
                    )
                    .offset(
                        x: UIConstants.MOVIE_FRAME.width + UIConstants.H_PADDING * 2,
                        y: width * ASPECT_RATIO / 2 - 25
                    )
                
                
                StarsView(rating: Float(movie.rating / 10 * 5))
                    .offset(
                        x: UIConstants.MOVIE_FRAME.width + UIConstants.H_PADDING * 2,
                        y: width * ASPECT_RATIO / 2 + UIConstants.MOVIE_FRAME.height / 2 - 15)
                
            }
        }
    }
}


//MARK: - Preview
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(
            movie: MovieModel(
                title: "The Dark Knight",
                overview: "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
                imageUrl: "https://wookie.codesubmit.io/static/posters/d6822b7b-48bb-4b78-ad5e-9ba04c517ec8.jpg",
                backdropUrl: "https://wookie.codesubmit.io/static/backdrops/d6822b7b-48bb-4b78-ad5e-9ba04c517ec8.jpg",
                director: "Christopher Nolan",
                cast: [
                    "Christian Bale",
                    "Heath Ledger",
                    "Aaron Eckhart"
                ],
                genres: [
                    "Action",
                    "Crime",
                    "Drama"
                ],
                rating: 3,
                year: "2008",
                length: "2h 32min"
            )
        )
    }
}
