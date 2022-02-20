//
//  MoviesSearchViewModel.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 17/02/2022.
//

import Foundation

class MoviesSeachViewModel: BaseViewModel{
    private let moviesRepository: MoviesRepositoryProtocol
    
    @MainActor @Published private(set) var moviesResult = [MovieModel]()
    
    var searchText = "" {
        didSet {
            search(query: searchText)
        }
    }

    init(moviesRepository: MoviesRepositoryProtocol){
        self.moviesRepository = moviesRepository
    }
    
    func search(query:String){
        Task{ @MainActor in
            do{
                state = .inProgress
                moviesResult = try await moviesRepository.searchMovies(query: query)
                state = .done
            }catch{
                print(error)
                state = .error(error.localizedDescription)
            }
        }
    }
}
