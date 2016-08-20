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

class CitiesViewController: UIViewController, StoreDelegate, UISearchBarDelegate {
    
    var cityResult:Results<City>!
    var storeHelper:StoreHelper!

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
        }
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

