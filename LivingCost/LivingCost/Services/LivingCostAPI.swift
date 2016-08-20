//
//  LivingCostAPI.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//  google JSON api + hatena bookmark hotentry

let domain = "https://nomadlist.com/api/v2/"


final class LivingCostAPI{
    
    
    class func getCities() -> [City]{
        LivingCostAPI.getData { (data:JSON?) in
            guard let data = data else { return }
            
            if let jsonResult = data["result"].array {
                var cities = [City]()
                
                for result in jsonResult {
                    let city = City()
                    city.name = result["info"]["city"]["name"].string!
                    
                    cities.append(city)
                }
            }
//            print(data)
            return cities
        }
    }
    
    
    private class func getData(callback: (JSON?) -> ()) {
        let url = domain + "list/cities"
        
        Alamofire.request(.GET, url, parameters: nil)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    callback(JSON(response.result.value!))
                case .Failure:
                    callback(nil)
                }
        }
    }
    
}

