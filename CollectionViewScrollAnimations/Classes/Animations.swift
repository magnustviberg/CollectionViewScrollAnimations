//
//  Animations.swift
//  CollectionViewScrollAnimations
//
//  Created by Magnus Tviberg on 01.11.2017.
//

import UIKit

public extension UIView {
    
    // MARK: - Fade
    
    // This methode let you adjust the alpha value on any UIView.
    // paramaters:
    //      fromValue:      The alpha value that the view has before the function is called
    //      toValue:        The alpha value that the view should have after the function is called
    //      startPage:      The fade animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    public func fade(fromValue: CGFloat, toValue: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress   > start && progress < end else { return }
        let progressPercentage = Percentage.percentageOf(value: progress, min: start, max: end)
        self.alpha = Percentage.convertPercentToNumber(percentage: progressPercentage, min: fromValue, max: toValue)
    }
}

public extension NSLayoutConstraint {
    
    // MARK: - Constraint length
    
    // This methode let you adjust the length of any NSLayoutConstraint.
    // paramaters:
    //      by value:       The length that you want to add to the constriant
    //      startLength:    The length of the constaint before it was adjusted
    //      startPage:      The animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    public func adjustConstraintLength(by value: CGFloat, startLength: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let progressPercentage = Percentage.percentageOf(value: progress, min: start, max: end)
        self.constant = value * progressPercentage + startLength
    }
    
    // This methode let you sets the length of any NSLayoutConstraint to a given length
    // paramaters:
    //      by value:       The length that you want the constraint to have after the function is called
    //      startLength:    The length of the constaint before it was adjusted
    //      startPage:      The animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    public func adjustConstraint(to value: CGFloat, startLength: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let progressPercentage = Percentage.percentageOf(value: progress, min: start, max: end)
        let number = Percentage.valueFrom(percentage: progressPercentage, value: startLength - value)
        self.constant = startLength - number
    }
    
    // MARK: - Constraint Center
    
    // This methode let you move the center NSLayoutConstraint in a direction along its axis.
    // paramaters:
    //      by value:       How far you want to move the center constaint in a direction
    //      startPage:      The animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    public func moveCenterConstraint(by value: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let distanceToMoveTheView = Percentage.percentageOf(value: progress, min: start, max: end)
        self.constant = (1 - distanceToMoveTheView) * value
    }
}


