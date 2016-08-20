//
//  ReadHelper.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import Foundation
import RealmSwift


class ReadHelper {
    
    class func getCities() -> Results<City>{
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all dogs less than 2 years old
        let cities = realm.objects(City.self).sorted("name")
        
        return cities
    }
    
    class func getCitiesWithFilter(textFilter: String) -> Results<City>{
        return getCities().filter("name beginsWith '\(textFilter)'")
    }
}