//
//  MovieDataMapper.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation

struct MovieDataMapper: Mapper{
    typealias To = MovieModel
    typealias From = MovieData
    
    private let dateMapper: DateMapper
    
    init(dateMapper: DateMapper){
        self.dateMapper = dateMapper
    }
    
    func map(_ model: MovieData) -> MovieModel {
        return MovieModel(
            title: model.title,
            overview: model.overview,
            imageUrl: model.posterUrl,
            backdropUrl: model.backdropUrl,
            director: model.director.singleName,
            cast: model.cast,
            genres: model.genres,
            rating: model.rating,
            year: dateMapper.map(model.releaseDate),
            length: model.length
        )
    }
}
