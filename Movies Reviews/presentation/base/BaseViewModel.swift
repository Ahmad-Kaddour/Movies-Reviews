//
//  BaseViewModel.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 16/02/2022.
//

import Foundation

class BaseViewModel: ObservableObject{
    @Published var state = State.notStarted
    
    enum State{
        case notStarted
        case error(String)
        case inProgress
        case done
    }
}
