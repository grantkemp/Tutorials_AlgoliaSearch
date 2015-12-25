//
//  ActorModel.swift
//  Algolia
//
//  Created by Grant Kemp on 25/12/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ActorRecord {
    let name: String?
    let rating: Int?
    let imagePath: String?
    let alternativeName:String?


init(jsonresponse:JSON) {
    name = jsonresponse[Constants.AlgoliaIndexConstants.name].stringValue
    rating = jsonresponse[Constants.AlgoliaIndexConstants.rating].intValue
    imagePath = jsonresponse[Constants.AlgoliaIndexConstants.imagePath].stringValue
    alternativeName = jsonresponse[Constants.AlgoliaIndexConstants.alternative_name].stringValue
}
    
}
