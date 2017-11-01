//
//  Percentage.swift
//  CollectionViewScrollAnimations
//
//  Created by Magnus Tviberg on 01.11.2017.
//

import Foundation

class Percentage {
    
    static func getPercentage(min: CGFloat, max: CGFloat, currentValue: CGFloat) -> CGFloat{
        return CGFloat((currentValue - min) / (max - min))
    }
    
    //Normal percentage
    static func valueFrom(percentage: CGFloat, value: CGFloat) -> CGFloat {
        return percentage * value
    }
    
    //value from percentage between
    static func convertPercentToNumber(percentage: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        return ((max - min) * percentage) + min
    }
    
    // Given a value, this function will return the percentage of that
    // value between the min and max supplied
    static func percentageOf(number: CGFloat, between min: CGFloat, and max: CGFloat, overflow: Bool = false) -> CGFloat {
        let percentage = (number - min)/(max - min)
        return overflow ? percentage : Swift.min(Swift.max(percentage, 0), 1)
    }
    
}

