//
//  DSAssets.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class DSAssets {
    
    static func colorFromName(_ name: String, alpha: CGFloat = 1.0) -> UIColor? {
        return UIColor(named: name, in: Bundle(for: self), compatibleWith: nil)?.withAlphaComponent(alpha)
    }
}
