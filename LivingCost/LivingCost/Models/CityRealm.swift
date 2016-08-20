//
//  CityRealm.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import Foundation
import RealmSwift


final class City: Object {
    dynamic var name = ""
    dynamic var country = ""
    dynamic var shortTerm:Float = 0.0
    dynamic var isGoingToCompare = false
    
//    init(name: String, country: String, shortTerm: Float, isGoingToCompare: Bool) {
//        self.name = name
//        self.country = country
//        self.shortTerm = shortTerm
//        self.isGoingToCompare = isGoingToCompare
//    }
    
}