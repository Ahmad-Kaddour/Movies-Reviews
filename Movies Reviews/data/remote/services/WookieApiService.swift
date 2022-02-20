//
//  WookieApiService.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

class WookieApiService: ApiService, MoviesApiService{

    func getMovieList() async throws -> GetMoviesResponse {
        return try await apiProvider.proceed(
            request: RequestsRouter.Get(path: RemoteConstants.ApiEndPoints.MOVIES_PATH),
            ofType: GetMoviesResponse.self
        )
    }
    
    func searchMovies(query: String) async throws -> GetMoviesResponse {
        return try await apiProvider.proceed(
            request: RequestsRouter.Get(
                path: RemoteConstants.ApiEndPoints.MOVIES_PATH,
                queryParams: QueryParams().addQuery(key: "q", value: query)
            ),
            ofType: GetMoviesResponse.self
        )
    }
}
