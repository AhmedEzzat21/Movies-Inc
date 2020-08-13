//
//  MoviesViewModel.swift
//  Movies Inc
//
//  Created by Ahmed on 8/12/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class MoviesViewModel {
    
    var moviesList : Variable<[MoviesModel]> = Variable([])
//    let provider: MoyaProvider<MovieAPI>
    func getMovies () {
 
        Loader.show()
        let provider = MoyaProvider<MovieAPI>()
        provider.rx.request(.getMovie).subscribe { event in
            
            switch event {
            case let .success(response):

                do {
                    let decoder = JSONDecoder()
                    let moviesResponse = try decoder.decode(MoviesResponse.self, from: response.data)

                    self.moviesList.value = moviesResponse.results ?? []
                    Loader.hide()
                }catch {
                    print("error >>> \(error.localizedDescription)")
                    Loader.hide()
                }


            case let .error(error):
                
                print(error)
                
            }
        }

        
    }
}
