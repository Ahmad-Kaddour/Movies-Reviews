//
//  MoviesSearchView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 17/02/2022.
//

import SwiftUI
import Resolver

struct MoviesSearchView: View {
    
    @StateObject private var viewModel: MoviesSeachViewModel = Resolver.resolve()

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color(.systemGray5).ignoresSafeArea()
                switch(viewModel.state){
                    
                case .inProgress:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .done:
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                         
                        ForEach(0..<viewModel.moviesResult.count, id: \.self) { index in
                            NavigationLink(destination:
                                            MovieDetailsView(movie: viewModel.moviesResult[index])
                                            .background(Color(.systemGray5))
                            ) {
                                MovieItemView(imageUrl:viewModel.moviesResult[index].imageUrl)
                                    .frame(
                                        width: UIConstants.MOVIE_FRAME.width,
                                        height: UIConstants.MOVIE_FRAME.height
                                    )
                            }
                        }
                    }
                }
                    
                case let .error(message):
                    VStack{
                        Text(message)
                        Button("retry"){
                            viewModel.search(query: viewModel.searchText)
                        }
                        .padding(20)
                        
                    }
                    
                default:
                    EmptyView()
                }
                
            }.searchable(text: $viewModel.searchText)
                .navigationTitle("Search")
        }
    }
}

struct MoviesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearchView()
    }
}
