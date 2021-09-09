//
//  HomeViewModel.swift
//  Movie_app
//
//  Created by Mac on 9/9/21.
//

import Foundation
import Alamofire
import SwiftyJSON


struct HomeViewModel {
    
    var delegate: HomeVMDelegate?
    let url = URLs()

    func getMoviesData(path: String) {
        
        var movies = [MovieModel]()
        
        AF.request(url.baseURL + path + "?api_key=\(url.api_key)", method: .get, encoding: JSONEncoding.default).response { (response) in
            
            switch response.result {
                case .success(let data):
                    if data != nil {
                        let jsonData = JSON(data!)
                        let results = jsonData["results"].arrayValue
                        for result in results {
                            let id = result["id"].intValue
                            let title = result["title"].string
                            let overview = result["overview"].string
                            let lang = result["original_language"].string
                            let backdrop_path = result["backdrop_path"].string
                            let poster_path = result["poster_path"].string
                            let release_date = result["release_date"].string
                            
                            let movieModel = MovieModel(id: id, backdrop_path: backdrop_path, poster_path: poster_path, title: title, overview: overview, language: lang, release_date: release_date)
                            movies.append(movieModel)
                        }
                        delegate?.getMovies(data: movies)
   
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
        
    }
    
}
