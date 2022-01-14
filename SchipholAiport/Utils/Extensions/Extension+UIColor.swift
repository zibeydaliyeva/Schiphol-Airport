//
//  Extension+UIColor.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 100) {
        self.init( red: r / 255, green: g / 255, blue:  b / 255,  alpha: a / 100 )
    }
    
    static var mainTextColor: UIColor {
        return UIColor(r: 33, g: 33, b: 33)
    }
    
    static var blueColor: UIColor {
        return UIColor(r: 66, g: 138, b: 186)
    }
    
    static var grayColor: UIColor {
        return UIColor(r: 181, g: 181, b: 181)
    }
    
    static var lightGrayColor: UIColor {
        return UIColor(r: 248, g: 248, b: 248)
    }
    
}

