//
//  FirstViewController.swift
//  LivingCost
//
//  Created by rafael reis on 20/08/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
//import SwiftyJSON
import RealmSwift

class CitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
//        var cityResult:Results<City>!
    var cities = [City]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableView()
        loadContent()
        testListCities()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTableView(){
        self.tableView.dataSource = self
    }
    
    
    func loadContent(){
        //MOCK DATA
        cities = LivingCostAPI.getMockCities()
        self.tableView.reloadData()
        
        
        
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


extension CitiesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let cityCell = tableView.dequeueReusableCellWithIdentifier(CityTableViewCell.CellID, forIndexPath: indexPath) as? CityTableViewCell {
            cityCell.city = cities[indexPath.row]
            cell = cityCell
        }
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

