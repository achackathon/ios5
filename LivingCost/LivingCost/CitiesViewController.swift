//
//  FirstViewController.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class CitiesViewController: UIViewController {
    
    var cityResult:Results<City>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadContent(){
        //try get local data
        cityResult = ReadHelper.getCities()
        if cityResult.count > 0 {
            testListCities()
            return
        }
        
        //get data from API
        LivingCostAPI.getCities { (cities: [City]) in
            StoreHelper.storeCities(cities);
        }
        
    }
    
    
    func testListCities(){
        cityResult = ReadHelper.getCities()
        if cityResult != nil {
            for city in cityResult{
                print (city.name)
                print (city.country)
                print (city.shortTerm)
                print ("-----")
            }
        }
    }


}

