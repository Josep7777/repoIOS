//
//  UIView+Constraints.swift
//  IOS
//
//  Created by Josep Romera Andreu on 22/3/24.
//

import Foundation
import UIKit

extension UIView {
    public enum ConstraintType {
        case Lesser
        case Equal
        case Greater
    }
    
    @discardableResult func ActivateConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    //MARK: Aligns
    
    
    @discardableResult func AlignRightConstrain(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true) ->
        NSLayoutConstraint {
            let constraint: NSLayoutConstraint
            let otherTrailingAnchor = safeArea ? other.safeAreaLayoutGuide.trailingAnchor:
            other.trailingAnchor
            switch(type){
            case .Lesser: constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor,constant: padding)
            case .Equal: constraint = self.leadingAnchor.constraint(equalTo: otherTrailingAnchor, constant: padding)
            case .Greater: constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor, constant: padding)
            }
            return constraint
        }
    
    @discardableResult func AlignLeftConstrain(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        AlignLeftConstrain(other: other, padding: padding, type: type)
        return self
    }
    //MARK
    
    @discardableResult func AlignTopConstrain(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true) ->
        NSLayoutConstraint {
            let constraint: NSLayoutConstraint
            let otherTopAnchor = safeArea ? other.safeAreaLayoutGuide.topAnchor:
            other.topAnchor
            switch(type){
            case .Lesser: constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherTopAnchor,constant: padding)
            case .Equal: constraint = self.topAnchor.constraint(equalTo: otherTopAnchor, constant: padding)
            case .Greater: constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: padding)
            }
            return constraint
        }
    
    @discardableResult func AlignBottomConstrain(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true) ->
        NSLayoutConstraint {
            let constraint: NSLayoutConstraint
            let otherBottomAnchor = safeArea ? other.safeAreaLayoutGuide.bottomAnchor:
            other.bottomAnchor
            switch(type){
            case .Lesser: constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherBottomAnchor,constant: padding)
            case .Equal: constraint = self.bottomAnchor.constraint(equalTo: otherBottomAnchor, constant: padding)
            case .Greater: constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherBottomAnchor, constant: padding)
            }
            return constraint
        }
    
    @discardableResult func pinTo (
        _other: UIView,
        padding: CGFloat,
        safeArea: Bool = true
    ) -> UIView {
        //self.ActivateConstraints().AlignTopConstrain(other: other,padding: padding,safeArea: safeArea)
    }
    }
    


