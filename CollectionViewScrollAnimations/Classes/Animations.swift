//
//  Animations.swift
//  CollectionViewScrollAnimations
//
//  Created by Magnus Tviberg on 01.11.2017.
//

import UIKit

public extension UIViewController {
    
    // MARK: - Fade
    
    // This methode let you adjust the alpha value on any UIView.
    // paramaters:
    //      view:           The UIView that you want to fade
    //      fromValue:      The alpha value that the view has before the function is called
    //      toValue:        The alpha value that the view should have after the function is called
    //      startPage:      The fade animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    
    public func fade(view: UIView, fromValue: CGFloat, toValue: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let alphaValueAtCurrentProgress = Percentage.getPercentage(min: start, max: end, currentValue: progress)
        view.alpha = Percentage.convertPercentToNumber(percentage: alphaValueAtCurrentProgress, min: fromValue, max: toValue)
    }
    
    // MARK: - Constraint
    
    // Constraint length
    // This methode let you adjust the length of any NSLayoutConstraint.
    // paramaters:
    //      constraint:     The NSLayoutConstraint of which you want to animate the length
    //      by value:       The alpha value that the view has before the function is called
    //      toValue:        The alpha value that the view should have after the function is called
    //      startPage:      The fade animation will start while transitioning from this page
    //      numberOfPages:  The total number of pages in the UICollectionView
    //      progress:       The current transition progress
    public func increaseOrDecreaseLength(_ constraint: NSLayoutConstraint, by value: CGFloat, startLength: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let distanceToMoveTheView = Percentage.getPercentage(min: start, max: end, currentValue: progress)
        constraint.constant = value * distanceToMoveTheView + startLength
    }
    
    // Center
    public func moveCenterConstraint(_ constraint: NSLayoutConstraint, by value: CGFloat, startPage: Int, numberOfPages: Int, progress: CGFloat) {
        let start = CGFloat(startPage - 1) / CGFloat(numberOfPages - 1)
        let end =  CGFloat(startPage) / CGFloat(numberOfPages - 1)
        guard progress > start && progress < end else { return }
        let distanceToMoveTheView = Percentage.getPercentage(min: start, max: end, currentValue: progress)
        constraint.constant = (1 - distanceToMoveTheView) * value
    }
    
}


