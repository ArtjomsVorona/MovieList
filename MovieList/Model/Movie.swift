//
//  Movie.swift
//  MovieList
//
//  Created by Artjoms Vorona on 11/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var imageName: String
    var genre: String
    var releaseYear: Int
    var description: String
    var trailerUrlString: String
    
    static func createMovies() -> [Movie] {
        var movies: [Movie] = []
        
        let titles = DataManager.shared.movieTitles
        let imageNames = DataManager.shared.imageNames
        let movieGenres = DataManager.shared.movieGenres
        let releaseYears = DataManager.shared.releaseYears
        let descriptions = DataManager.shared.descriptions
        let trailerUrlStrings = DataManager.shared.movieTrailerUrls
        
        for i in 0..<titles.count {
            let movie = Movie(title: titles[i], imageName: imageNames[i], genre: movieGenres[i], releaseYear: releaseYears[i], description: descriptions[i], trailerUrlString: trailerUrlStrings[i])
            movies.append(movie)
        }
        
        return movies
    }
}
