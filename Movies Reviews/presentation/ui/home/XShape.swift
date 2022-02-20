//
//  XShape.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 14/02/2022.
//

import SwiftUI

struct XShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}
