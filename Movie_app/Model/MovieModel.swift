//
//  MovieModel.swift
//  Movie_app
//
//  Created by Mac on 9/8/21.
//

import UIKit

struct MovieModel {
    let image: UIImage
    let title: String
    let poster_path: String
    let overview: String
    let genre: [Genre]
    let budget: Double
    let language: String
    let release_date: String
    let credits: Credits
}

struct Genre {
    let id: Int
    let name: String
}

struct Credits {
    let cast: [Cast]
    let crew: [Crew]
}

struct Cast {
    let gender: Int
    let id: Int
    let name: String
    let profile_path : String
    let cast_id: Int
//    "adult": false,
//    "known_for_department": "Acting",
//    "popularity": 1.807,
//    "character": "Holding Cell Inmate (uncredited)",
//    let credit_id: String
//    "order": 23
}

struct Crew {
    let gender: Int
    let id: Int
    let name: String
    let department: String
    let job: String
//    "adult": false,
//    "popularity": 0.6,
//    "credit_id": "60f7e622310325005da3a1ee",
//    "known_for_department": "Visual Effects",

}
