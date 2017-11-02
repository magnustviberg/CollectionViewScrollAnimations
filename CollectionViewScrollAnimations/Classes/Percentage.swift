//
//  Percentage.swift
//  CollectionViewScrollAnimations
//
//  Created by Magnus Tviberg on 01.11.2017.
//

import Foundation

class Percentage {
    
    // Given a value, this function will return the percentage of that
    // value between the min and max supplied
    // Paramaters:
    //      min:            The start value
    //      max:            The end value
    //      value:          Current progress. A value between min and max
    static func percentageOf(value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat{
        return CGFloat((value - min) / (max - min))
    }
    
    // This methode return a CGFloat that is the X percent of value
    // Paramaters:
    //      percentage:     The percentage of value that should be returned
    //      value:          If percentage is 1.0, then this value will be returned
    static func valueFrom(percentage: CGFloat, value: CGFloat) -> CGFloat {
        return percentage * value
    }
    
    // This methode return a CGFloat that is a given percentage between two numbers.
    // Works like the getPercentage functions but the other way around.
    // Paramaters:
    //      percentage:     The percentage the value that should be returned is between min and max
    //      min:            The start value
    //      max:            The end value
    static func convertPercentToNumber(percentage: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        return ((max - min) * percentage) + min
    }
    
    // Given a value, this function will return the percentage of that
    // value between the min and max supplied. With the overflow parameter
    // we can make sure number always is in the range between min and max.
    // Paramaters:
    //      value:          A number that you want to return its percentage between min and max
    //      min:            The start value
    //      max:            The end value
    //      overflow:       If true, value can never be smaller than min or bigger than max
    static func percentageOf(value: CGFloat, min: CGFloat, max: CGFloat, overflow: Bool = false) -> CGFloat {
        let percentage = (value - min)/(max - min)
        return overflow ? percentage : Swift.min(Swift.max(percentage, 0), 1)
    }
    
}

