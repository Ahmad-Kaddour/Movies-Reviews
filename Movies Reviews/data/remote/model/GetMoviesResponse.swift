//
//  GetMoviesResponse.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation


struct GetMoviesResponse: Codable{
    let movies: [MovieData]
}

struct MovieData: Codable{
    let id: String
    let title: String
    let releaseDate: String
    let posterUrl: String
    let backdropUrl: String
    let overview: String
    let director: Director
    let cast: [String]
    let genres: [String]
    let length: String
    let rating: Double
    let slug: String
    let classification: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "released_on"
        case posterUrl = "poster"
        case backdropUrl = "backdrop"
        case overview
        case director
        case cast
        case genres
        case length
        case rating = "imdb_rating"
        case slug
        case classification
    }
}


enum Director: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Director.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Director"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
    
    var singleName: String{
        switch self {
        case .string(let x):
            return x
        case .stringArray(let x):
            return x.count > 0 ? x[0] : ""
        }
    }
}
