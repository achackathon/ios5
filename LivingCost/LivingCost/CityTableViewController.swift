//
//  CityTableViewController.swift
//  LivingCost
//
//  Created by ac-mnascimento-mac on 8/20/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
import ImageLoader

class CityTableViewController: UITableViewController {
    
    @IBOutlet weak var cityImage: UIImageView!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    @IBOutlet weak var internetSpeed: UILabel!
    @IBOutlet weak var freeWifi: UILabel!
    @IBOutlet weak var airCon: UILabel!
    
    
    @IBOutlet weak var airbnb: UILabel!
    @IBOutlet weak var hotel: UILabel!
    
    
    @IBOutlet weak var priceForLocals: UILabel!
    @IBOutlet weak var priceShortTerm: UILabel!
    @IBOutlet weak var priceLongTerm: UILabel!
    
    
    @IBOutlet weak var coworking: UILabel!
    
    
    @IBOutlet weak var coffee: UILabel!
    @IBOutlet weak var beer: UILabel!
    @IBOutlet weak var softDrinks: UILabel!
    
    
    
    
    var city : City!
    
    func updateUI(){
        
        let url: String = city.photoURL
        let urlWithEscaping = url.stringByReplacingOccurrencesOfString("\\", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        self.cityImage?.load(urlWithEscaping)
        self.cityImage?.contentMode = .ScaleAspectFill
        
        self.cityLabel.text = self.city.name
        self.country.text = self.city.country
        self.region.text = self.city.regionName
        
        self.internetSpeed.text = "\(self.city.internetSpeed)"
        self.freeWifi.text = self.city.freeWifiAvailable ? "yes" : "no"
        
        self.airbnb.text = "\(formatPrice((self.city.cost?.airbnb)!))"
        self.priceForLocals.text = "\(formatPrice((self.city.cost?.locals)!))"
        self.priceShortTerm.text = "\(formatPrice((self.city.cost?.shortTerm)!))"
        self.priceLongTerm.text = "\(formatPrice((self.city.cost?.longTerm)!))"
        self.hotel.text = "\(formatPrice((self.city.cost?.hotel)!))"
        
        self.beer.text = "\(formatPrice((self.city.cost?.beer)!))"
        self.coffee.text = "\(formatPrice((self.city.cost?.coffee)!))"
        self.softDrinks.text = "\(formatPrice((self.city.cost?.softDrink)!))"
        
        self.weather.text = "Confortable"
        self.humidity.text = "\(self.city.weatherHumidity)"
        self.temperature.text = "\(self.city.weatherTemperature)"
        

        
    }
    
    
    private func formatPrice(price: Float) -> String{
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.stringFromNumber(price)
        return formatter.stringFromNumber(price)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
         self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        if section == 0{
            return 130
        }else{
            return 0
        }
        
    
    
    }


//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }


//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
//
//
//
//        return cell
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
