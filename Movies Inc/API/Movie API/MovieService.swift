//
//  MovieService.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

protocol MovieService: Service {
    func getPopularMovies(page: Int, completion: @escaping Response<PopularMoviesResponse>)
    func getGenres(completion: @escaping Response<[Genre]>)
}
