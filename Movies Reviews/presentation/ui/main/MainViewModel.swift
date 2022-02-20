//
//  MainViewModel.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

class MainViewModel: BaseViewModel {
    private let moviesRepository: MoviesRepositoryProtocol
    
    @MainActor @Published private(set) var movieGenresMap = [String:[MovieModel]]()
    
    init(moviesRepository: MoviesRepositoryProtocol){
        self.moviesRepository = moviesRepository
    }
    
    func fetchMovies(){
        Task{ @MainActor in
            do{
                state = .inProgress
                movieGenresMap = try await moviesRepository.getMoviesGenreMap()
                state = .done
            }catch{
                print(error)
                state = .error(error.localizedDescription)
            }
        }
    }
}
