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
    dynamic var photoURL = ""
    
    dynamic var regionName = ""
    dynamic var weatherTemperature:Float = 0.0
    dynamic var weatherHumidity:Float = 0.0
    
    //convenience - scores
    dynamic var internetSpeed = 0
    dynamic var freeWifiAvailable = false
    dynamic var airconAvailable = false
    
    dynamic var cost: Cost?

}