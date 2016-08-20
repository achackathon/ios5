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

class CitiesViewController: UIViewController, StoreDelegate, UISearchBarDelegate {
    
    struct Segues {
        static let CityDetails = "cityDetails"
    }
    
    var cityResult:Results<City>!
    var totalCitiesSelected = 0
    var selectedCities = [String]()
    var storeHelper:StoreHelper!
    var currentCity: City!


    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableView()
        loadContent()
        self.tabBarController?.tabBar.tintColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    

    
    
    func loadContent(){
        //MOCK DATA
        //cities = LivingCostAPI.getMockCities()
        storeHelper = StoreHelper()
        storeHelper.delegate = self
        
        
        //try get local data
        cityResult = ReadHelper.getCities()
        if cityResult.count > 0 {
            self.tableView.reloadData()
            return
        }
        
        //get data from API
        LivingCostAPI.getCities { (cities: [City]) in
            self.storeHelper.storeCities(cities);
        }
        
    }
    
    
    func didStoreData() {
        cityResult = ReadHelper.getCities()
        self.tableView.reloadData()
    }
    
    
    //MARK: UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        cityResult = ReadHelper.getCitiesWithFilter(searchText)
        
        self.tableView.reloadData()
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

extension CitiesViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentCity = self.cityResult[indexPath.row]
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("cityDetails") as! CityTableViewController
        nextVC.city = self.currentCity
        self.navigationController?.pushViewController(nextVC, animated: true)
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
        //cityCell.city.isGoingToCompare = !cityCell.city.isGoingToCompare
        
        //dispatch_async(dispatch_queue_create("background", nil)) {
            let realm = try! Realm()
            //let theDog = realm.objects(Dog.self).filter("age == 1").first
            try! realm.write {
                cityCell.city.isGoingToCompare = !cityCell.city.isGoingToCompare
            }
        //}
        
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

