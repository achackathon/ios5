//
//  CityTableViewCell.swift
//  LivingCost
//
//  Created by ac-mnascimento-mac on 8/20/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
import ImageLoader
import RealmSwift

protocol CityTableDelegate: class{
    func checkCity(state: Int, name: String, cityCell: CityTableViewCell)
}

class CityTableViewCell: UITableViewCell {
    
    static let CellID: String = "CityCell"
    
    weak var delegate:CityTableDelegate?
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!
    
    var toggleState = 1
    
    
    @IBAction func selectCity(sender: UIButton) {
        if toggleState == 1 {
            toggleState = 2
            sender.setImage(UIImage(named: "ok-32"),forState:UIControlState.Normal)
        } else {
            toggleState = 1
            sender.setImage(UIImage(named: "circle-outline-32"),forState:UIControlState.Normal)
        }

        self.delegate?.checkCity(toggleState, name: city.name, cityCell: self)
    }
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var shortTermCostLabel: UILabel!
    
    var city: City! {
        didSet {
            self.updateUI()
        }
    }
    
    private func formatPrice(price: Float) -> String{
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.stringFromNumber(price)
        return formatter.stringFromNumber(price)!
    }
    
    func updateUI(){
        let url: String = city.photoURL
        let urlWithEscaping = url.stringByReplacingOccurrencesOfString("\\", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        self.cityImageView?.load(urlWithEscaping)
        self.cityImageView?.contentMode = .ScaleAspectFill
        self.cityNameLabel.text = city.name
        self.countryNameLabel.text = city.country
        self.shortTermCostLabel.text = "\(self.formatPrice(city.shortTerm))"
        if self.city.isGoingToCompare {
            self.toggleButton.setImage(UIImage(named: "ok-32"),forState:UIControlState.Normal)
        } else {
            self.toggleButton.setImage(UIImage(named: "circle-outline-32"),forState:UIControlState.Normal)
        }
    }

}


