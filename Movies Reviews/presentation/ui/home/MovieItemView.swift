//
//  MovieItemView.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 14/02/2022.
//

import SwiftUI

struct MovieItemView : View{
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string:imageUrl)){ image in
            image.resizable()
        } placeholder: {
            XShape()
                .stroke(.gray, lineWidth: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 1)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .cornerRadius(1)
        .clipped()
    }
}

