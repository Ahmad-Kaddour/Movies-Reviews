//
//  MoviesRepositoryImpl.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver

struct MoviesRepository: MoviesRepositoryProtocol {
    
    private let moviesService: MoviesApiService
    private let mapper: MovieDataMapper
    
    init(moviesService: MoviesApiService, mapper: MovieDataMapper){
        self.moviesService = moviesService
        self.mapper = mapper
    }
    
    func getMoviesGenreMap() async throws -> [String : [MovieModel]] {
        var map = [String : [MovieModel]]()
        let moviesResponse = try await moviesService.getMovieList()
        
        moviesResponse.movies.map(mapper.map(_:)).forEach{movieModel in
            movieModel.genres.forEach{genre in
                map[genre, default:[]].append(movieModel)
            }
        }
        return map
    }
    
    func searchMovies(query: String) async throws -> [MovieModel] {
        return try await moviesService
            .searchMovies(query: query)
            .movies.map(mapper.map(_:))
    }
}
