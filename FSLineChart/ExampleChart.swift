//
//  ExampleChart.swift
//  FSLineChart
//
//  Created by Arthur GUIBERT on 01/11/2016.
//  Copyright © 2016 Arthur GUIBERT. All rights reserved.
//

import UIKit

class ExampleChart: FSLineChart {
    override func awakeFromNib() {
        load()
    }
    
    public func load() {
        var data: [Int] = []
        
        // Generate some dummy data
        for _ in 0...10 {
            data.append(Int(20 + (arc4random() % 100)))
        }
        
        verticalGridStep = 5
        horizontalGridStep = 9
        labelForIndex = { "\($0)" }
        labelForValue = { "$\($0)" }
        setChartData(data)
    }
    
}
