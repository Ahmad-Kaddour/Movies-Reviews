//
//  Mapper.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation

protocol Mapper{
    associatedtype To
    associatedtype From
    
    func map(_ model: From) -> To
    func map(_ models: [From]) -> [To]
    
    func unmap(_ model: To) throws -> From
    func unmap(_ models: [To]) throws -> [From]
}

extension Mapper{
    func map(_ models: [From]) -> [To] {
        return models.map(self.map(_:))
    }
    
    func unmap(_ model: To) throws -> From {
        fatalError("Method has not been implemented")
    }

    func unmap(_ models: [To]) throws -> [From] {
        return try models.map(self.unmap(_:))
    }
}
