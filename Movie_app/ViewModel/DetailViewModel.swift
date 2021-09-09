//
//  DetailViewModel.swift
//  Movie_app
//
//  Created by Mac on 9/10/21.
//

import Foundation
import Alamofire
import SwiftyJSON


struct DetailViewModel {
    
    var delegate: DetailVMDelegate?
    let url = URLs()

    func getCastData(movieId id: Int) {
        
        var cast = [Cast]()
        
        AF.request(url.baseURL + "movie/\(id)/credits?api_key=\(url.api_key)", method: .get, encoding: JSONEncoding.default).response { (response) in
            
            switch response.result {
                case .success(let data):
                    if data != nil {
                        let jsonData = JSON(data!)
                        print(jsonData)
                        let casts = jsonData["cast"].arrayValue
                        for actor in casts {
                            let name = actor["name"].string
                            let profile_path = actor["profile_path"].string
                            let id = actor["id"].intValue
                            let cast_id = actor["cast_id"].intValue
                            let castModel = Cast(id: id, name: name, profile_path: profile_path, cast_id: cast_id)
                            cast.append(castModel)
                        }
                        delegate?.getCast(data: cast)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
        
    }
    
}

