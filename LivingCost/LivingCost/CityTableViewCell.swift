//
//  CityTableViewCell.swift
//  LivingCost
//
//  Created by ac-mnascimento-mac on 8/20/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let CellID: String = "CityCell"
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var shortTermCostLabel: UILabel!
    
    var city: City! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        self.cityNameLabel.text = city.name
        self.countryNameLabel.text = city.country
        self.shortTermCostLabel.text = "\(city.shortTerm)"
//        self.
    }

}
