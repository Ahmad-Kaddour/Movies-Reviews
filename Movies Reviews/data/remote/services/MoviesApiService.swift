//
//  MoviesApiService.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Alamofire

protocol MoviesApiService{
    func getMovieList() async throws -> GetMoviesResponse
    func searchMovies(query: String) async throws -> GetMoviesResponse
}
