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


final class LivingCostAPI{
    
    static let domain = "https://nomadlist.com/api/v2/"
    static let imageDomain = "https://nomadlist.com"
    
    class func getCities(callback: ([City]) -> Void){
        
        LivingCostAPI.getData { (data:JSON?) in
            guard let data = data else { return }
            
            if let jsonResult = data["result"].array {
                var cities = [City]()
                
                
                
                for result in jsonResult {
                    let city = City()
                    
                    city.name = result["info"]["city"]["name"].string!
                    city.country = result["info"]["country"]["name"].string!
                    city.shortTerm = result["cost"]["shortTerm"]["USD"].float!
                    city.photoURL = imageDomain + result["media"]["image"]["500"].string!
                    
                    city.regionName = result["info"]["region"]["name"].string!
                    city.weatherTemperature = result["info"]["weather"]["temperature"]["celsius"].float!
                    city.weatherHumidity = result["info"]["weather"]["humidity"]["value"].float!
                    city.internetSpeed = result["info"]["internet"]["speed"]["download"].int!
                    city.freeWifiAvailable = result["scores"]["free_wifi_available"].int! == 1
                    city.airconAvailable = result["scores"]["aircon"].int! == 1
                    
                    
                    city.cost = Cost()
                    city.cost!.airbnb = result["cost"]["airbnb_median"]["USD"].float!
                    
                    city.cost!.coffee = result["cost"]["airbnb_median"]["USD"].float!
                    city.cost!.beer = result["cost"]["airbnb_median"]["USD"].float!
                    city.cost!.softDrink = result["cost"]["non_alcoholic_drink_in_cafe"]["USD"].float!
                    
                    
                    
                    cities.append(city)
                    
                }
                callback(cities)
            }
            //            print(data)
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
    
    static func getMockCities() -> [City]{
        var cities = [City]()
        
        for _ in 0..<10 {
            let city = City()
            city.name = "Bangkok"
            city.country = "Thailand"
            city.shortTerm = 123.12
            city.isGoingToCompare = false
            cities.append(city)
        }
        
        return cities
    }
}

