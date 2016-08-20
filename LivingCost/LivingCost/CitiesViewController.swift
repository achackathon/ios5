//
//  FirstViewController.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import RealmSwift

class CitiesViewController: UIViewController {
    
//    var cityResult:Results<City>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadContent()
        testListCities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadContent(){
        //try get local data
//        cityResult = ReadHelper.getCities()
//        if cityResult.count > 0 {
//            return
//        }
//        
//        //get data from API
//        let cities = LivingCostAPI.getCities()
//        StoreHelper.storeCities(cities);
    }
    
    
    func testListCities(){
//        if cityResult != nil {
//            for city in cityResult{
//                print (city.name)
//            }
//        }
    }


}

