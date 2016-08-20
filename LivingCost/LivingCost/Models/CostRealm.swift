//
//  CostRealm.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import Foundation
import RealmSwift


final class Cost: Object {
    
    dynamic var coffee:Float = 0.0
    dynamic var beer:Float = 0.0
    
    dynamic var softDrink:Float = 0.0
    
    dynamic var shortTerm:Float = 0.0
    dynamic var locals:Float = 0.0
    dynamic var longTerm:Float = 0.0
    dynamic var hotel:Float = 0.0
    dynamic var airbnb:Float = 0.0
    
    dynamic var coworkingMonthly:Float = 0.0
    
    

    
}