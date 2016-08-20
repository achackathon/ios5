//
//  StoreHelper.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol StoreDelegate {
    func didStoreData()
}


class StoreHelper{
    
    var delegate:StoreDelegate!

    func storeCities(cities: [City]) {
        
        //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
         //   autoreleasepool {
                // Get realm and table instances for this thread
                let realm = try! Realm()
                
//                realm.beginWrite()
                for city in cities {
                    try! realm.write {
                        realm.add(city)
                    }
//                    realm.create(City.self, value: [
//                        "name": city.name,
//                        "country": city.country,
//                        "shortTerm": city.shortTerm,
//                        "isGoingToCompare": city.isGoingToCompare,
//                        "photoURL": city.photoURL,
//                        "regionName": city.regionName,
//                        "weatherTemperature": city.weatherTemperature,
//                        "weatherHumidity": city.weatherHumidity,
//                        
//                        "internetSpeed": city.internetSpeed,
//                        "freeWifiAvailable": city.freeWifiAvailable,
//                        "airconAvailable": city.airconAvailable,
//                       
//                        ]
//                    )
//                }
        
                // Commit the write transaction
                // to make this data available to other threads
       //         try! realm.commitWrite()
            }

            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.delegate.didStoreData();
            })
    }
}