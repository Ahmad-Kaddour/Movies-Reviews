//
//  MoviesRepository.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getMoviesGenreMap() async throws -> [String: [MovieModel]]
    func searchMovies(query: String) async throws -> [MovieModel]
}
