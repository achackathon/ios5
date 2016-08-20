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
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            autoreleasepool {
                // Get realm and table instances for this thread
                let realm = try! Realm()
                
                realm.beginWrite()
//                if cities.count > 0 {
//                    realm.delete(cities)
//                }
                for city in cities {
                    realm.create(City.self, value: [
                        "name": city.name,
                        "shortTerm": city.shortTerm,
                        "country": city.country,
                        "isGoingToCompare": city.isGoingToCompare,
                        "photoURL": city.photoURL,
                        ]
                    )
                }
                
                // Commit the write transaction
                // to make this data available to other threads
                try! realm.commitWrite()
            }
            
            
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.delegate.didStoreData();
            })
            
            
            
            
        }
    }

}