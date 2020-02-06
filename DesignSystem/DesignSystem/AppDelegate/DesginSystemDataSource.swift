//
//  DesginSystemDataSource.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class DesginSystemDataSource {
    
    var sections: [DesignSystemSection] {
        didSet {
            updateDisplaySections()
        }
    }
    
    init() {
        self.sections = [ButtonSection()]
    }
    
    
    func updateDisplaySections() {
        
    }
}
