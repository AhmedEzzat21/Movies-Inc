//
//  MovieAPI.swift
//  Movies Inc
//
//  Created by Ahmed on 8/12/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import Moya

let PUBLIC_KEY = "c63b807fa4ece444d23a94e2ba3a7c5e"

enum MovieAPI {

    case getMovie
    case MovieDetail(movieID : Int)
    
}

// MARK: - TargetType

extension MovieAPI: TargetType {
    // 1
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org?")!

       
    }
    
    // 2
    public var path: String {
        
        switch self {
        case .getMovie:
            return "/3/movie/top_rated"
            
        case .MovieDetail(let movieID):
            return "/3/movie/\(movieID)"
        }
    }
    
    // 3
    public var method: Moya.Method {
        switch self {
        case .getMovie , .MovieDetail: return .get
      
        }
    }
    
    // 4
    public var sampleData: Data {
        return Data()
    }
    
    // 5
    public var task: Task {
        switch self {
        case .getMovie:
            return .requestParameters(parameters: ["api_key" : PUBLIC_KEY , "language" : "en-US" , "page" : "1"], encoding: URLEncoding.queryString) // TODO
        
        case .MovieDetail:
            return .requestParameters(parameters: ["api_key" : PUBLIC_KEY , "language" : "en-US"], encoding: URLEncoding.queryString) // TODO
            
        }
        
    }
    
    // 6
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}
