//
//  GhibliEntity.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import Foundation

struct GhibliResponses: Codable {
    var films: [Film]
}

struct Film: Codable {
    let id: String
    let title: String
    let image: String
    let description: String
    let releaseDate: String
}

extension Film: Equatable {
    static func == (rhs: Film, lsh: Film) -> Bool {
        return lsh.id == rhs.id
    }
}

struct GhibliViewModel {
    struct Cell: GhibliCellViewModel {
        var imageName: String
        var movieTitle: String
        var releaseDate: String
        var description: String
    }
    
    let cells: [Cell]
}
