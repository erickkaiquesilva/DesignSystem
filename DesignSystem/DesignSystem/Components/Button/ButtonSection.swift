//
//  ButtonSection.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ButtonSection: DesignSystemSection {
    
    var name: String = "Buttons"
    
    var components: [DesignSystemComponent]
    
    init() {
        components = [ButtonViewController()]
    }
}
