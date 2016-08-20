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
    
    var cityResult:Results<City>!
    
    var totalCitiesSelected = 0
    
    var selectedCities = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableView()
        loadContent()
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
        //cities = LivingCostAPI.getMockCities()
        
        
        
        
        //try get local data
        cityResult = ReadHelper.getCities()
        if cityResult.count > 0 {
            self.tableView.reloadData()
            return
        }
        
        //get data from API
        LivingCostAPI.getCities { (cities: [City]) in
            StoreHelper.storeCities(cities);
        }
        
    }
    
    
}


extension CitiesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityResult.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let cityCell = tableView.dequeueReusableCellWithIdentifier(CityTableViewCell.CellID, forIndexPath: indexPath) as? CityTableViewCell {
            let city = cityResult[indexPath.row]
            cityCell.city = city
            cell = cityCell
            cityCell.delegate = self
        }
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension CitiesViewController: CityTableDelegate {
    func switchTabItem() {
        if self.totalCitiesSelected > 3 {
            if  let arrayOfTabBarItems =  self.tabBarController!.tabBar.items as! AnyObject as? NSArray,tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
                tabBarItem.enabled = false
            }
        } else {
            if  let arrayOfTabBarItems = self.tabBarController!.tabBar.items as! AnyObject as? NSArray,tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
                tabBarItem.enabled = true
            }
        }
    }
    func checkCity(state: Int, name: String, cityCell: CityTableViewCell) {
        if (state == 2) {
            self.totalCitiesSelected += 1
            self.selectedCities.append(cityCell.city.name)
        } else {
            self.totalCitiesSelected -= 1
            self.selectedCities.removeLast()
        }
        switchTabItem()
    }
}

