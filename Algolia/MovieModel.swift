//
//  MovieModel.swift
//  Algolia
//
//  Created by Grant Kemp on 23/12/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MovieRecord {
    let title: String
    let image: String
    let rating: Int
    let year: Int
    
    
    init(json:JSON) {
        title = json["_highlightResult", "title", "value"].stringValue
        image = json["image"].stringValue
        rating = json["rating"].intValue
        year = json["year"].intValue
    }
}