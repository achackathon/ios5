//
//  CompareViewController.swift
//  LivingCost
//
//  Created by ac-mnascimento-mac on 8/20/16.
//  Copyright © 2016 Nexer. All rights reserved.
//

import UIKit
import Charts

class CompareViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    
    var detailNames: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNames = ["Hotel", "Living", "Coworking space", "Coffee", "Beer"]
        let values = [150.0, 300.0, 50.0, 3.0, 5.0]
        setChart(detailNames, values: values)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)

        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Cities")
        
        chartDataSet.colors = ChartColorTemplates.colorful()
        let chartData = BarChartData(xVals: detailNames, dataSet: chartDataSet)
        barChartView.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
