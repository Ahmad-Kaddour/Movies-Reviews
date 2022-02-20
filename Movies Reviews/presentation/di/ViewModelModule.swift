//
//  ViewModelModule.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation
import Resolver

extension Resolver{
    static func registerViewModelServices() {
        register{
            MainViewModel(moviesRepository: resolve())
        }
        
        register{
            MoviesSeachViewModel(moviesRepository: resolve())
        }
    }
}

