//
//  DesignSystemSection.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol DesignSystemSection {
    
    var name: String { get set }
    var components: [DesignSystemComponent] { get set }
    
}
