//
//  ColorsConfiguration.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public struct DSColors {
    static func colorOrDefault(_ name: String, alpha: CGFloat = 1.0) -> UIColor {
        return DSColors.colorOrDefault(name, alpha: alpha) ?? UIColor.black
    }
    
    public static var lightColor: UIColor {
        return colorOrDefault("light")
    }
    
    public static var darkColor: UIColor {
        return colorOrDefault("dark")
    }
    
    public static var greenDefault: UIColor {
        return colorOrDefault("green")
    }
    
    public static var redDefault: UIColor {
        return colorOrDefault("red")
    }
    
    public static var yellowDefault:  UIColor {
        return colorOrDefault("yellow")
    }
    
    public static var blueDefault: UIColor {
        return colorOrDefault("blue")
    }
    
    public static var grayDefault: UIColor {
        return colorOrDefault("gray")
    }
    
    public static var witheDefault: UIColor {
        return colorOrDefault("withe")
    }
}
